//
//  InputBorder.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputBorder: View {
    @State var inputText: String = ""
    @State var inputStatus: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Section("边框颜色 .border()") {
                TextField("根据输入内容显示边框颜色", text: $inputText) { inputStatus in
                    self.inputStatus = true
                }
                .textFieldStyle(.roundedBorder)
                .border(tipsBorder)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(".border()")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // 输入框编辑状态 边框颜色
    var tipsBorder: some ShapeStyle {
        if inputStatus {
            return inputText.count < 1 ? Color.red : Color.green;
        } else {
            return Color.gray
        }
    }
}

struct InputBorder_Previews: PreviewProvider {
    static var previews: some View {
        InputBorder()
    }
}
