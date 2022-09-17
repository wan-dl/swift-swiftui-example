//
//  api_clipboard.swift
//  HelloSwift
//
//  Created by 1 on 8/5/22.
//

import SwiftUI

struct api_clipboard: View {
    @State var inputText:String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        Form {
            Section(header: Text("剪切板功能，主要用到了 UIPasteboard.general").textCase(.none)) {
                TextEditor(text: $inputText)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .focused($isFocused)
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            self.isFocused = true
                        }
                    }
            }
            
            Button("将输入框内容写入剪贴板", action: {
                UIPasteboard.general.string = self.inputText
            })
            
            Button("读取剪切板到输入框", action: {
                if UIPasteboard.general.hasStrings {
                    self.inputText = UIPasteboard.general.string ?? ""
                }
            })
        }
        .navigationTitle("clipboard")
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "clipboard"))
    }
}

struct api_clipboard_Previews: PreviewProvider {
    static var previews: some View {
        api_clipboard()
    }
}
