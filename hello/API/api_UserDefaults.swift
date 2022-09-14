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
        
        VStack(alignment: .leading) {
            
            Group() {
                TextField("用户名", text: $username)
                    .keyboardType(.asciiCapable)
                    .textFieldStyle(HelloSwift.formStyle())
                    .onAppear(perform: setData)
                
                SecureField("密码", text: $password)
                    .textFieldStyle(HelloSwift.formStyle())
                    .keyboardType(.numberPad)
            }
            .padding()
            
            Text("备注：离开此视图时，输入框中的内容会自动保存到UserDefaults中!")
                .font(.footnote)
                .padding()
            
            Button(action: {
                clearData()
            }, label: {
                Label("清除UserDefaults数据", systemImage: "xmark.circle")
            })
            .cornerRadius(30)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .foregroundColor(.white)
            .background(.blue)
            .padding()
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.init(uiColor: UIColor(hexString: "#F2F2F6")))
        .onDisappear() {
            UserDefaults.standard.set(self.username, forKey: "username")
            UserDefaults.standard.set(self.password, forKey: "password")
        }
        .navigationBarTitle("UserDefaults", displayMode: .inline)
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

struct formStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Text("")
                .padding(.horizontal, 2)
            configuration
                .frame(height: 40)
        }
        .background(.white)
    }
}


struct api_UserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        api_UserDefaults()
    }
}
