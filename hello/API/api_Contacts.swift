//
//  api_ABAddressBook.swift
//  HelloSwift
//
//  Created by 1 on 8/5/22.
//
import UIKit
import SwiftUI
import Contacts

struct contactsItem: Identifiable {
    let id = UUID()
    let name: String
    let phoneNumber: String
}

var contactsList: [contactsItem] = []

struct api_Contacts: View {
    
    @State var isShowToast: Bool = false
    @State var ToastMessage: String = ""
    
    @State var contactsList: [contactsItem] = []
    
    @State var ContactPermission: Bool = false
    @State var isPresented: Bool = false
    
    var body: some View {
        ScrollView {
            
            Text("说明：本页面示例，使用Contacts库。")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            VStack {
                Button(action: {
                    self.ContactPermission = checkPermissions()
                    isPresented.toggle()
                }, label: {
                    Label("检查访问通讯录权限", systemImage: "")
                })
                .buttonStyle(PrimaryBtnStyle())
                .alert(isPresented: $isPresented) {
                    if ContactPermission {
                        return Alert(title: Text("您已取得通讯录权限"))
                    } else {
                        return Alert(
                            title: Text("发现通讯录朋友"),
                            message: Text("当前没有权限访问联系人。进入系统设置，将[通讯录]设置为开启。"),
                            primaryButton: .default(Text("设置"),action: openSetting),
                            secondaryButton: .cancel(Text("拒绝"))
                        )
                    }
                }
                
                Button(action: {
                    contactsList = readAllContacts()
                }, label: {
                    Label("读取联系人列表", systemImage: "")
                })
                .buttonStyle(PrimaryBtnStyle())
            }
            .toast(isShow: $isShowToast, info: ToastMessage)
            
            Divider()
            
            if !self.contactsList.isEmpty {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(contactsList) { item in
                            HStack {
                                Text(item.name)
                                Spacer()
                                Text(item.phoneNumber)
                            }
                            .frame(height: 30)
                            .padding(.horizontal, 10)
                        }
                    }
                    .background(.gray.opacity(0.1))
                }
                .frame(height: 300)
            }
        }
        .padding()
        .navigationBarTitle("Contacts - 通讯录", displayMode: .inline)
    }
    
    // 检查是否有权限访问联系人
    func checkPermissions() -> Bool {
        var checkResult: Bool = false
        CNContactStore().requestAccess(for: .contacts) { (isRight, error) in
            checkResult = isRight
        }
        return checkResult
    }
    
    // 打开手机系统设置
    func openSetting() {
        if #available(iOS 10, *) {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        } else {
            if let appSettings = NSURL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.openURL(appSettings as URL)
            }
        }
    }
    
    func readContacts() {
        let store = CNContactStore()
        do {
            let predicate = CNContact.predicateForContacts(matchingName: "陈霄")
            let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
            let contacts = try store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)
            print("Fetched contacts: \(contacts)")
        } catch {
            print("Failed to fetch contact, error: \(error)")
        }
    }
    
    // 遍历所有联系人
    func readAllContacts() -> Array<contactsItem> {
        
        let authStatus = CNContactStore.authorizationStatus(for: .contacts)
        print("authorizationStatus-----------\(authStatus)")
        
        let status = checkPermissions()
        if !status {
            ToastMessage = "没有权限获取通联系人"
            isShowToast.toggle()
            return []
        }
        
        var contactData: [contactsItem] = []
        
        let store = CNContactStore()
        let toFetch = [CNContactFamilyNameKey, CNContactGivenNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: toFetch)
        
        do{
            try store.enumerateContacts(with: request, usingBlock: {
                (contact : CNContact, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
                let name = contact.familyName +  contact.givenName
                
                var phones:String = ""
                for phone in contact.phoneNumbers {
                    let phoneNumber = phone.value.stringValue
                    phones = phones.isEmpty ? phoneNumber : phones + "," + phoneNumber
                }
                contactData.append(contactsItem(name: name, phoneNumber: phones))
            })
        } catch let err{
            print(err)
        }
        return contactData
    }
}


struct api_Contacts_Previews: PreviewProvider {
    static var previews: some View {
        api_Contacts()
    }
}
