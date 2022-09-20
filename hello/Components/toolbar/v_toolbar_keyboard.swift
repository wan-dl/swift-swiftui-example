//
//  v_toolbar_keyboard.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

struct v_toolbar_keyboard: View {
    @State var text: String = ""
    @State var fontType: Font = .body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("请将光标置于输入框中，然后查看键盘。\n\n本页面示例 是对 toolbar placement: .keyboard 的应用展示。")
                .font(.callout)
                .foregroundColor(.gray)
            
            TextEditor(text: $text)
                .frame(height: 150)
                .font(fontType)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.secondary, lineWidth: 1)
                )
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("加粗") { fontType = .body.bold() }
                        Button("斜体") { fontType = .body.italic() }
                        Spacer()
                    }
                }
            
            Spacer()
        }
        .padding()
    }
}

struct v_toolbar_keyboard_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_keyboard()
    }
}
