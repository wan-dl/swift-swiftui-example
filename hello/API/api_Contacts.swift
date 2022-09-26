//
//  api_Contacts.swift
//  HelloSwift
//
//  Created by 1 on 8/5/22.
//

import SwiftUI
import Contacts

struct contactsItem: Identifiable {
    let id = UUID()
    let name: String
    let phoneNumber: String
}

struct api_Contacts: View {
    
    @State var isShowToast: Bool = false
    @State var ToastMessage: String = ""
    
    @State var ContactPermission: Bool = false
    @State var isPresented: Bool = false
    
    @State var contactsList: [contactsItem] = []
    
    var body: some View {
        ScrollView {
            
            Text("说明：本页面通讯录示例，使用Contacts库。页面右上角，即可查看源码。")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            VStack {
                Button("检查访问通讯录权限") {
                    self.ContactPermission = checkPermissions()
                    self.isPresented.toggle()
                }
                .buttonStyle(PrimaryBtnStyle())
                .alert(isPresented: $isPresented) {
                    if self.ContactPermission {
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
                
                Button("读取联系人列表") {
                    readAllContacts()
                }
                .buttonStyle(PrimaryBtnStyle())
            }
            
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
        .navigationTitle("Contacts - 通讯录")
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "Contacts"))
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
    
    // 遍历所有联系人
    func readAllContacts() {
        //let authStatus = CNContactStore.authorizationStatus(for: .contacts)
        //print("authorizationStatus-----------\(authStatus)")
        
        let status = checkPermissions()
        if !status {
            self.ContactPermission = false
            self.isPresented.toggle()
        }
        
        DispatchQueue.global().async {
            let store = CNContactStore()
            let toFetch = [CNContactFamilyNameKey, CNContactGivenNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
            let request = CNContactFetchRequest(keysToFetch: toFetch)
            
            var contactsData: [contactsItem] = []
            try? store.enumerateContacts(with: request, usingBlock: {
                (contact : CNContact, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
                let name = contact.familyName +  contact.givenName
                
                var phones:String = ""
                for phone in contact.phoneNumbers {
                    let phoneNumber = phone.value.stringValue
                    phones = phones.isEmpty ? phoneNumber : phones + "," + phoneNumber
                }
                contactsData.append(contactsItem(name: name, phoneNumber: phones))
            })
            self.contactsList = contactsData
        }
    }
    
    // 读取通讯录特定姓名联系人 - 暂时未用到
    func readContacts() {
        let store = CNContactStore()
        let name = "王小二"
        do {
            let predicate = CNContact.predicateForContacts(matchingName: name)
            let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
            let contacts = try store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)
            print("Fetched contacts: \(contacts)")
        } catch {
            print("Failed to fetch contact, error: \(error)")
        }
    }
}


struct api_Contacts_Previews: PreviewProvider {
    static var previews: some View {
        api_Contacts()
    }
}
