//
//  v_Form.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct v_Form: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isRemember: Bool = false
    
    var body: some View {
        VStack {
            Form {
                Section() {
                    TextField("username", text: $username)
                    
                    SecureField("password", text: $password)
                    
                    Toggle("是否记住密码", isOn: $isRemember)
                }
                
                Button("登录", action: {
                    print("您输入的内容：\(username) \(password)")
                })
                .frame(alignment: .center)
            }
        }
        .navigationBarTitle("Form")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Form"))
    }
}

struct v_Form_Previews: PreviewProvider {
    static var previews: some View {
        v_Form()
    }
}
