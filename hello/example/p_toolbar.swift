//
//  p_toolbar.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct p_toolbar: View {
    @State var text: String = ""
    @State var fontType: Font = .body
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .frame(height: 150)
                .font(fontType)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.primary, lineWidth: 1)
                )
                .padding()
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("加粗") { fontType = .body.bold() }
                        Button("斜体") { fontType = .body.italic() }
                        Spacer()
                    }
                }
            
            Text("备注：请将光标置于输入框中，然后查看键盘")
        }
        .navigationBarTitle("toolbar示例", displayMode: .inline)
    }
}

struct p_toolbar_Previews: PreviewProvider {
    static var previews: some View {
        p_toolbar()
    }
}
