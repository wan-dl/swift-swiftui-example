//
//  v_Input.swift
//  format
//
//  Created by 1 on 7/27/22.
//

// https://zhuanlan.zhihu.com/p/423878795

import SwiftUI

struct v_Input: View {
    struct keyt: Identifiable {
        let id = UUID()
        let desc: String
    }
    let keyboardTypeList: Array = [
        keyt(desc: "数字模式的键盘、手机号键盘")
    ]
    
    @State private var nickName: String = ""
    @State private var nickNameStatus: Bool = false
    
    @State private var price = ""
    @State private var intNumber = 0
    @State private var decimalNumber = 0
    @State private var decimalNumber2 = 0
    @State private var inputNumber = 0
    
    @State private var inputContent: String = ""
    
    @State private var phoneNumber: String = ""
    @State private var phoneCode: String = ""
    @State private var url: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var user: String = ""
    
    @State private var text1: String = ""
    @State private var text2: String = ""
        
    let formatterPrice: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var body: some View {
        ScrollView() {
            VStack(alignment: .leading, spacing: 15) {
                Group {
                    Section(header: Text("自动获取焦点的输入框").padding(.horizontal, 5)) {
                        TextFieldFocus()
                    }
                    
                    Section(header: Text("带有搜索图标的输入框").padding(.horizontal, 5)) {
                        InputWithSearchIcon()
                    }
                    
                    Section(header: Text("带有清除图标的输入框").padding(.horizontal, 5)) {
                        TextField("带有清除图标的输入框", text: $text2)
                            .textFieldStyle(InputWithClearIcon(text: $text2))
                    }
                }
                
                Group {
                    Section(header: Text("光标颜色 .accentColor()").padding(.horizontal, 5)) {
                        TextField("光标显示显示红色", text: $text1)
                            .textFieldStyle(InputStyle())
                            .accentColor(.red)
                    }
                    
                    Section(header: Text("边框颜色 .border()").padding(.horizontal, 5)) {
                        TextField("根据输入内容长度显示边框颜色", text: $nickName) { nickNameStatus in
                            self.nickNameStatus = true
                        }
                        .textFieldStyle(InputStyle())
                        .border(tipsBorder)
                    }
                }
                
                Group {
                    Section(header: Text("格式化 货币").padding(.horizontal, 5)) {
                        TextField("格式化数字为货币", value: $decimalNumber, formatter: formatterPrice)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(InputStyle())
                    }
                }

                Group {
                    Section(header: Text("显示标准ASCII字符的键盘 .default").padding(.horizontal, 5)) {
                        TextField("这是一个可输入中英文、数字的输入框", text: $inputContent)
                            .keyboardType(.default)
                            .textFieldStyle(InputStyle())
                    }

                    Section(header: Text("数字小键盘 .keyboardType(.numberPad)").padding(.horizontal, 5)) {
                        TextField("这是一个纯数字输入框", value: $intNumber, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .textFieldStyle(InputStyle())
                    }

                    Section(header: Text("数字小键盘 .decimalPad").padding(.horizontal, 5)) {
                        TextField("这是一个可输入小数的输入框", value: $decimalNumber2, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                            .textFieldStyle(InputStyle())
                    }
                }

                Group {
                    Section(header: Text("手机号码").padding(.horizontal, 5)) {
                        TextField("这是一个手机号码输入框", text: $phoneNumber)
                            .keyboardType(.phonePad)
                            .textContentType(.telephoneNumber)
                            .textFieldStyle(InputStyle())
                    }
                    
                    Section(header: Text("手机验证码").padding(.horizontal, 5)) {
                        TextField("这是一个快速输入验证码的输入框", text: $phoneNumber)
                            .keyboardType(.numberPad)
                            .textContentType(.oneTimeCode)
                            .textFieldStyle(InputStyle())
                    }
                    
                    Section(header: Text("密码输入框 SecureField").padding(.horizontal, 5)) {
                        SecureField("密码输入框", text: $password)
                            .textContentType(.password)
                            .textFieldStyle(InputStyle())
                    }
                }
                
                Group {
                    Section(header: Text("URL .URL").padding(.horizontal, 5)) {
                        TextField("这是一个URL输入框", text: $url)
                            .keyboardType(.URL)
                            .textContentType(.URL)
                            .textFieldStyle(InputStyle())
                    }

                    Section(header: Text("邮箱 .emailAddress").padding(.horizontal, 5)) {
                        TextField("这是一个email输入框", text: $email)
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                            .textFieldStyle(InputStyle())
                    }
                }
                
                Group {
                    Section(header: Text("键盘右下角显示下一项").padding(.horizontal, 5)) {
                        TextField("键盘右下角按钮显示下一项", text: $user)
                            .submitLabel(.next)
                            .textFieldStyle(InputStyle())
                    }

                    Section(header: Text("键盘右下角显示搜索").padding(.horizontal, 5)) {
                        TextField("键盘右下角按钮显示搜索", text: $user)
                            .submitLabel(.search)
                            .textFieldStyle(InputStyle())
                    }
                    
                    
                    Section(header: Text("键盘右下角显示完成").padding(.horizontal, 5)) {
                        TextField("键盘右下角按钮显示完成", text: $user)
                            .submitLabel(.done)
                            .textFieldStyle(InputStyle())
                    }

                }
            }
            
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
        .background(.gray.opacity(0.1))
        .submitScope()
        .onTapGesture {
            closeKeyBoard()
        }
        .navigationBarTitle(Text("TextField"), displayMode: .inline)
        
    }
    
    // 点击空白处关闭键盘
    func closeKeyBoard() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow!.endEditing(true)
    }
    
    // 输入框编辑状态 边框颜色
    var tipsBorder: some ShapeStyle {
        if nickNameStatus {
            return nickName.count < 3 ? Color.red : Color.green;
        } else {
            return Color.white
        }
    }
}

// 定制height=40, 背景为白色的输入框
struct InputStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Text("")
                .padding(.horizontal, 2)
            configuration
                .frame(height: 40)
        }.background(.white)
    }
}

// 自动聚焦弹出键盘
struct TextFieldFocus: View {
    @FocusState var isFocused: Bool
    @State private var inputText: String = ""
    
    var body: some View {
        TextField("自动聚焦的输入框", text: $inputText)
            .textFieldStyle(InputStyle())
            .focused($isFocused)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isFocused = true
                }
            }
    }
}

// 输入框图标
struct WithInputIconStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.horizontal, 3)
            configuration
                .padding(.vertical, 10)
        }
        .cornerRadius(20)
    }
}

// 带有图标的搜索
struct InputWithSearchIcon: View {
    @State var searchText:String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        TextField("搜索", text: $searchText)
            .textFieldStyle(WithInputIconStyle())
            .background(.white)
            .focused($isFocused)
            .onChange(of: isFocused) { value in
                print("------------\(value)")
            }
            .onAppear {
                // 当进入此页面时，将焦点置于搜索框中，并自动弹出键盘
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isFocused = true
                }
            }
    }
}

// 带有清除按钮的输入框
struct InputWithClearIcon: TextFieldStyle {
    @Binding var text: String

    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            configuration
                .padding()
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                })
                .padding(.trailing, 10)
            }
        }
        .padding(.horizontal, 10)
        .border(.gray)
    }
}

struct v_Input_Previews: PreviewProvider {
    static var previews: some View {
        v_Input()
    }
}
