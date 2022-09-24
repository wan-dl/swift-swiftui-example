//
//  v_modifier.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI

struct fStyle: ViewModifier {
    @State var color: Color = .black
    
    func body(content: Content) -> some View {
        content
            .font(.body)
            .padding(10)
            .frame(width: 120)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(color)
    }
}

extension View {
    func borderedCaption(_ color: Color) -> some View {
        modifier(fStyle(color: color))
    }
}

struct v_modifier: View {
    var body: some View {
        VStack() {
            
            Text("以下示例，是对 .modifier() 修饰符的运用。\n\n示例创建了一种带有圆角矩形包围文本的视图修饰符。")
                .foregroundColor(.gray)
                .font(.callout)
                .frame(height: 120)
                .padding()
            
            Group {
                // 示例1
                Text("Download")
                    .modifier(fStyle(color: .blue))
                
                // 示例2
                Text("Upload")
                    .borderedCaption(.blue)
                
                // 示例3
                Text("Data")
                    .borderedCaption(.pink)
            }
        }
        .navigationTitle("modifier")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "modifier"))
    }
}

struct v_modifier_Previews: PreviewProvider {
    static var previews: some View {
        v_modifier()
    }
}
