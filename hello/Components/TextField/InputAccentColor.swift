//
//  InputAccentColor.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputAccentColor: View {
    @State var inputText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("简介：关于光标颜色, iOS 13.0~6.0, 为：.accentColor()。iOS 16.0起，新增了 .tint()")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            Section("光标颜色") {
                if #available(iOS 16.0, *) {
                    TextField("光标显示显示红色", text: $inputText)
                        .textFieldStyle(.roundedBorder)
                        .gaugeStyle(.linearCapacity)
                        .accentColor(.red)
                        .tint(.red)
                } else {
                    TextField("光标显示显示红色", text: $inputText)
                        .textFieldStyle(.roundedBorder)
                        .accentColor(.red)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("accentColor")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI", pageID: "InputAccentColor"))
    }
}

struct InputAccentColor_Previews: PreviewProvider {
    static var previews: some View {
        InputAccentColor()
    }
}
