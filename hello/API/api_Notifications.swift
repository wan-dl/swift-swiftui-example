//
//  api_Notifications.swift
//  HelloSwift
//
//  Created by 1 on 8/28/22.
//

import SwiftUI
import UserNotifications


enum NotificatioType: String, CaseIterable, Identifiable {
    case 定时推送
    case 延迟推送
    var id: Self { self }
}

extension String {
    var isBlank: Bool {
        let tStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return tStr.isEmpty
    }
}

struct api_Notifications: View {
    
    @State var NotificationTitle: String = "Hello"
    
    @State var NotificationBody: String = "今天做核酸了吗？"
    let placeholderString: String = "通知内容..."
    
    @State var NotificatioID: NotificatioType = .定时推送
    
    // 定时通知
    @State private var date = Date()
    @State private var TriggerCalendarDate: String = ""
    
    // 延迟时间
    @State var TriggerTimeInterval: String = "5"
    
    @State var isShowToast: Bool = false
    @State var toastMessage: String = ""
    
    @State var isAlert: Bool = false
    @State var alertMessage: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            TextField("通知标题", text: $NotificationTitle)
                .padding(.horizontal, 15).frame(height: 50).background(.white).cornerRadius(5)
            
            TextEditor(text: $NotificationBody)
                .padding(.horizontal, 5)
                .frame(height: 120)
                .frame(maxWidth: .infinity,maxHeight: 120)
                .background(.white).cornerRadius(5)
                .foregroundColor(.primary)
            
            // UI: 通知类型以及通知设置
            UI_NotificationType
                
            Button("开始推送", action: {
                closeKeyBoard()
                let checkResult = check()
                if (checkResult) {
                    requestNotificatoin()
                }
            })
            .buttonStyle(PrimaryBtnStyle())
            .alert(self.alertMessage, isPresented: $isAlert) {
                Button("OK", role: .cancel) { }
            }
            .toast(isShow: $isShowToast, info: toastMessage)
            
            Spacer()
        }
        .padding()
        .background(.gray.opacity(0.1))
        .navigationTitle("通知")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    var UI_NotificationType: some View {
        VStack {
            HStack {
                Text("通知类型")
                Spacer()
                Picker("通知类型", selection: $NotificatioID) {
                    ForEach(NotificatioType.allCases) { item in
                        Text(item.rawValue.capitalized)
                    }
                }.pickerStyle(.menu)
            }
            .padding(.horizontal, 15).frame(height: 50).background(.white).cornerRadius(5)
            
            VStack {
                if NotificatioID == .定时推送 {
                    DatePicker(
                        "推送时间",
                        selection: $date,
                        displayedComponents: [.hourAndMinute]
                    )
                } else {
                    HStack {
                        Text("延迟时间(秒)")
                        TextField("", text: $TriggerTimeInterval)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.numberPad)
                            .frame(maxWidth: .infinity,alignment: .center)
                    }
                }
            }
            .padding(.horizontal, 15).frame(height: 50).background(.white).cornerRadius(5)
        }
    }
    
    func check() -> Bool {
        if (self.NotificationTitle.isBlank || self.NotificationBody.isBlank) {
            self.toastMessage = "通知标题或通知内容不能为空"
            self.isShowToast.toggle()
            return false
        }
        if (self.NotificatioID == .延迟推送) {
            if (self.TriggerTimeInterval.isBlank) {
                self.toastMessage = "延迟时间不能为空"
                self.isShowToast.toggle()
                return false
            }
            let re = NSPredicate(format: "SELF MATCHES %@", "^[0-9]*$")
            if !re.evaluate(with: self.TriggerTimeInterval) {
                self.toastMessage = "延迟时间仅能设置为数字，如5、10"
                self.isShowToast.toggle()
                return false
            }
        }
        return true
    }
    
    // 请求通知
    func requestNotificatoin() {
        Task {
            do {
                let result = try await requestAuthorizationForNotifications()
                
                if result == false {
                    self.alertMessage = "当前应用没有打开通知，请允许通知"
                    self.isAlert.toggle()
                } else {
                    makeNotification()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func makeNotification() {
        var trigger: UNNotificationTrigger
        switch NotificatioID {
            case .定时推送:
                self.TriggerCalendarDate = UTC_to_Local(from: "\(date)", customFromat: "yyyy:MM:dd:HH:mm")
                let TriggerCalendar = self.TriggerCalendarDate.components(separatedBy: ":").map { item in
                    Int(item)!
                }
                
                var dateComponents = DateComponents()
                //dateComponents.year = TriggerCalendar[0]
                //dateComponents.month = TriggerCalendar[1]
                //dateComponents.day = TriggerCalendar[2]
                dateComponents.hour = TriggerCalendar[3]
                dateComponents.minute = TriggerCalendar[4]
                trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                self.toastMessage = "通知设置已完成，将于\(TriggerCalendarDate)显示"
            case .延迟推送:
                let ti = Double(self.TriggerTimeInterval)
                trigger = UNTimeIntervalNotificationTrigger(timeInterval: ti!, repeats: false)
                self.toastMessage = "通知设置已完成，将于 \(String(describing: ti)) 后显示"
        }
        
        //通知内容
        let content = UNMutableNotificationContent()
        content.title = self.NotificationTitle
        content.body = self.NotificationBody
        content.badge = 1
        
        // 通知提示音
        content.sound = UNNotificationSound.defaultCritical
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        //将通知添加到UNUserNotificationCenter队列中
        UNUserNotificationCenter.current().add(request) { err in
            err != nil ? print("添加本地通知错误", err!.localizedDescription) : print("添加本地通知成功")
        }
        
        self.isShowToast.toggle()
    }
    
    func requestAuthorizationForNotifications() async throws -> Bool {
        let notificationCenter = UNUserNotificationCenter.current()
        
        // .alert表示是否允许弹窗； .sound表示是否允许提示音；.badge表示通知弹窗中的那个小图。
        let authorizationOptions: UNAuthorizationOptions = [.alert, .sound, .badge]

        do {
            let authorizationGranted = try await notificationCenter.requestAuthorization(options: authorizationOptions)
            return authorizationGranted
        } catch {
            throw error
        }
    }

    func checkCurrentAuthorizationSetting() async {
        let notificationCenter = UNUserNotificationCenter.current()
        let currentSettings = await notificationCenter.notificationSettings()
        
        switch currentSettings.authorizationStatus {
            case .authorized:
                print("... authorized")
            case .denied:
                print("... denied")
            case .ephemeral:
                print("... ephemeral")
            case .notDetermined:
                print("... notDetermined")
            case .provisional:
                print("... provisional")
            @unknown default:
                print("... default")
        }
    }
    
    // 将utc时间转换为当前时间
    func UTC_to_Local(from UTCDate: String, customFromat: String = "yyyy-MM-dd HH:mm:ss") -> String {
            
        let dateFormatter = DateFormatter.init()
        
        // UTC 时间格式
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        let utcTimeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.timeZone = utcTimeZone

        guard let dateFormatted = dateFormatter.date(from: UTCDate) else {
            return ""
        }

        // 输出格式
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = customFromat
        let dateString = dateFormatter.string(from: dateFormatted)
        return dateString
    }

}

struct api_Notifications_Previews: PreviewProvider {
    static var previews: some View {
        api_Notifications()
    }
}



