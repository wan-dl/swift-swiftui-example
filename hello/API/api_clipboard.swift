//
//  api_clipboard.swift
//  HelloSwift
//
//  Created by 1 on 8/5/22.
//

import SwiftUI

//enum FocusedField:Hashable{
//   case name,password
//}

struct api_clipboard: View {
    @State var inputText:String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        ScrollView() {
            
            Text("说明：本页面功能主要用到了： UIPasteboard.general ")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            VStack {
                TextEditor(text: $inputText)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .focused($isFocused)
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            self.isFocused = true
                        }
                    }
                
                Button("将输入框内容写入剪贴板", action: {
                    UIPasteboard.general.string = self.inputText
                })
                .buttonStyle(PrimaryBtnStyle())
                
                Button("读取剪切板到输入框", action: {
                    if UIPasteboard.general.hasStrings {
                        self.inputText = UIPasteboard.general.string ?? ""
                    }
                })
                .buttonStyle(PrimaryBtnStyle())
            }
            
        }
        .padding(.horizontal, 10)
        .background(.gray.opacity(0.1))
        .navigationTitle("clipboard")
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "clipboard"))
    }
}


struct api_clipboard_Previews: PreviewProvider {
    static var previews: some View {
        api_clipboard()
    }
}
