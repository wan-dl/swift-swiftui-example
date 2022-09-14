//
//  InputStyle.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

private let intro: String = "简介: iOS上，textFieldStyle, 有3种样式: .automation、.plain、.roundedBorder。当然，您也可以自定义Style。遵行TextFieldStyle协议，重写_body方法即可"

struct InputStyle: View {
    @State var inputText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text(intro)
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            Section(".automatic") {
                TextField("placeholder", text: $inputText)
                    .textFieldStyle(.automatic)
            }
            
            Section(".plain") {
                TextField("placeholder", text: $inputText)
                    .textFieldStyle(.plain)
            }
            
            Section(".roundedBorder") {
                TextField("placeholder", text: $inputText)
                    .textFieldStyle(.roundedBorder)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("textFieldStyle")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI", pageID: "InputStyle"))
    }
}

struct InputStyle_Previews: PreviewProvider {
    static var previews: some View {
        InputStyle()
    }
}
