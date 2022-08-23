//
//  LifeCycle.swift
//  HelloSwift
//
//  Created by 1 on 8/22/22.
//

import SwiftUI

struct LifeCycle: View {
    
    @State private var email: String = ""
    @FocusState var emailFieldIsFocused: Bool
    
    @State var isShowTotase: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Form {
                TextField("user email", text: $email)
                    .submitLabel(.done)
                    .keyboardType(.emailAddress)
                    .focused($emailFieldIsFocused)
                    .onChange(of: email, perform: { [email] value in
                        print("App:: --> .onChange: 字符串email值发生了变化，从 \(email) 更新为: \(value)")
                    })
                    .onSubmit {
                        print("App:: --> .onSubmit")
                        let validateResult = validateEmail(email: self.email)
                        if (!validateResult) {
                            self.isShowTotase.toggle()
                        }
                    }
                    .onTapGesture {
                        print("App:: --> .onTapGesture")
                    }
            }
            .toast(isShow: $isShowTotase, info: "邮箱无效")
            .onAppear() {
                print("App:: --> .onAppear")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    emailFieldIsFocused = true
                }
            }
            .onDisappear() {
                print("App:: --> .onDisappear")
            }
            .task(id: email) {
                print("App:: --> task: \(email)")
            }
        }
    }
    
    
    func validateEmail(email: String) -> Bool {
           if email.count == 0 {
               return false
           }
           let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
           let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
           return emailTest.evaluate(with: email)
    }
}

struct LifeCycle_Previews: PreviewProvider {
    static var previews: some View {
        LifeCycle()
    }
}
