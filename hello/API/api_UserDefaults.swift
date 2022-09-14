//
//  api_UserDefaults.swift
//  HelloSwift
//
//  Created by 1 on 8/3/22.
//

import SwiftUI

//
//public protocol UserDefaultsProtocol {
//    var key: String { get }
//}
//
//extension UserDefaultsProtocol {
//    public var string: String? {
//            return UserDefaults.standard.string(forKey: key)
//        }
//}

struct api_UserDefaults: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        List {
            Section(header: Text("备注：离开此视图时，输入框中的内容会自动保存到UserDefaults中").textCase(.none)) {
                TextField("用户名", text: $username)
                    .keyboardType(.asciiCapable)
                    .onAppear(perform: setData)
                
                SecureField("密码", text: $password)
                    .keyboardType(.numberPad)
            }
            
            Button("清除UserDefaults数据") {
                clearData()
            }
        }
        .onDisappear() {
            UserDefaults.standard.set(self.username, forKey: "username")
            UserDefaults.standard.set(self.password, forKey: "password")
        }
        .navigationTitle("UserDefaults")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "UserDefaults"))
    }
    
    func setData() {
        let u = UserDefaults.standard.string(forKey: "username")
        if u != nil {
            self.username = u!
        }
        let p = UserDefaults.standard.string(forKey: "password")
        if p != nil {
            self.password = p!
        }
    }
    
    func clearData() {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        
        self.username = ""
        self.password = ""
    }
}


struct api_UserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        api_UserDefaults()
    }
}
