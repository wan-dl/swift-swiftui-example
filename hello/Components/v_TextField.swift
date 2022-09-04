//
//  v_TextField.swift
//  format
//
//  Created by 1 on 7/27/22.
//

import SwiftUI

struct v_TextField: View {
    
    var body: some View {
        List {
            Section() {
                NavigationLink("输入框样式", destination: InputStyle())
            }
            Section() {
                NavigationLink("自动获取焦点的输入框", destination: InputAutoFocus())
                NavigationLink("收起键盘", destination: InputCloseKeyBoard())
            }
            
            Section() {
                NavigationLink("带有图标的输入框", destination: InputWithIcon())
            }
            
            Section() {
                NavigationLink("键盘右下角按钮", destination: InputKeyboardButtons())
            }
            
            Section() {
                NavigationLink("输入框显示不同的键盘类型", destination: InputKeyboardType())
                NavigationLink("密码输入框", destination: InputSecureField())
            }
            
            Section() {
                NavigationLink("格式化输入内容 - formatter", destination: InputFormatter())
                NavigationLink("onEditingChanged & onCommit", destination: InputOn())
            }
            
            Section() {
                NavigationLink("输入框光标颜色", destination: InputAccentColor())
                NavigationLink("输入框边框颜色", destination: InputBorder())
            }
        }
        .navigationTitle("TextField")
        .navigationBarTitleDisplayMode(.inline)
        
    }
   
}

// 定制height=40, 背景为白色的输入框
struct InputCustomStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            Text("")
                .padding(.horizontal, 2)
            configuration
                .frame(height: 40)
        }.background(.white)
    }
}


struct v_TextField_Previews: PreviewProvider {
    static var previews: some View {
        v_TextField()
    }
}
