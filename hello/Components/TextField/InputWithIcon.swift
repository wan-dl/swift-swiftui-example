//
//  InputwithSearchIcon.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputWithIcon: View {
    @State var searchText:String = ""
    @State var text2: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            // 带有图标的输入框
            Section("带有图标的输入框") {
                TextField("placeholder", text: $searchText)
                    .textFieldStyle(WithInputIconStyle())
                    .background(.white)
            }
            
            Section("输入框尾部带有清除图标") {
                TextField("placeholder", text: $text2)
                   .textFieldStyle(InputWithClearIcon(text: $text2))
            }
            
            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(.gray.opacity(0.1))
        .navigationTitle("带有图标的输入框")
        .navigationBarTitleDisplayMode(.inline)
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
                .frame(height: 40)
        }
        .cornerRadius(20)
    }
}

// 带有清除按钮的输入框
struct InputWithClearIcon: TextFieldStyle {
    @Binding var text: String

    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            configuration
                .padding(.horizontal, 10)
                .frame(height: 40)

            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                })
                .padding(.trailing, 10)
            }
        }.background(.white)
    }
}

struct InputWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        InputWithIcon()
    }
}
