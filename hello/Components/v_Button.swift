//
//  ViewButton.swift
//  format
//
//  Created by 1 on 7/27/22.
//

import SwiftUI

struct v_Button: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Button("Plain 样式按钮", action: {})
                .buttonStyle(PlainButtonStyle())
            
            Button("默认 样式按钮", action: {})
            
            Button(".bordered 样式按钮", action: {})
                .buttonStyle(.bordered)
            
            Button("蓝色背景按钮", action: {})
                .buttonStyle(.borderedProminent)
            
            Group {
                Button(action: {}, label: {
                    HStack {
                       Image(systemName: "star")
                       Text("带有SF符号的按钮")
                    }.padding(8)
                })
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Button("带有缩放效果的按钮", action: {})
                .buttonStyle(withScaleEffectButtonStyle())
            
        }
        .navigationBarTitle("Button")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Button"))
    }
}

// 点击带有缩放效果的按钮
struct withScaleEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .foregroundColor(.white)
                .padding(10)
        }
        .background(.blue)
        .cornerRadius(10)
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct v_Button_Previews: PreviewProvider {
    static var previews: some View {
        v_Button()
    }
}
