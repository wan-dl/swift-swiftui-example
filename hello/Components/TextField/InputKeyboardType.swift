//
//  InputKeyboardType.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputKeyboardType: View {
    @State var inputDefault: String = ""
    @State var inputNumber: String = ""
    @State var inputDecimalNumber: String = ""
    
    @State var phoneNumber: String = ""
    @State var phoneNumverVerificationCode: String = ""
    
    @State var inputURL: String = ""
    @State var inputEmail: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("简介：本页面示例，主要用到了.keyboardType() 和 .textContentType()")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .frame(height: 80)
                
                Section("默认键盘 .default") {
                    TextField("默认键盘, 显示标准ASCII字符的键盘", text: $inputDefault)
                        .keyboardType(.default)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("数字键盘 .keyboardType(.numberPad)") {
                    TextField("数字键盘，键盘显示0-9", value: $inputNumber, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("键盘带有小数点 .decimalPad") {
                    TextField("这是一个可输入小数的输入框", text: $inputDecimalNumber)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("手机号码 .phonePad") {
                    TextField("这是一个手机号码输入框", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .textContentType(.telephoneNumber)
                        .textFieldStyle(.roundedBorder)
                }

                Section("手机验证码") {
                    TextField("这是一个快速输入验证码的输入框", text: $phoneNumverVerificationCode)
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("键盘带有. / .com等字符") {
                    TextField("这是一个URL输入框", text: $inputURL)
                        .keyboardType(.URL)
                        .textContentType(.URL)
                        .textFieldStyle(.roundedBorder)
                }

                Section("键盘带有@字符 .emailAddress") {
                    TextField("这是一个email输入框", text: $inputEmail)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .textFieldStyle(.roundedBorder)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(".keyboardType")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InputKeyboardType_Previews: PreviewProvider {
    static var previews: some View {
        InputKeyboardType()
    }
}
