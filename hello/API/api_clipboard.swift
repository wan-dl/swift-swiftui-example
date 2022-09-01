//
//  api_clipboard.swift
//  HelloSwift
//
//  Created by 1 on 8/5/22.
//

import SwiftUI

enum FocusedField:Hashable{
   case name,password
}

struct api_clipboard: View {
    @State var writeText:String = ""
    @State var readText:String = ""
    
    @FocusState var focus: FocusedField?
    @State var showAlert: Bool = false
    
    
    var body: some View {
        ScrollView() {
            
            Text("说明：本页面功能主要用到了： UIPasteboard.general ")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            VStack {
                TextEditor(text: $writeText)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .focused($focus, equals: .name)
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            focus = .name
                        }
                    }
            }
            
            VStack(alignment: .center) {
                Button("将输入框内容写入剪贴板", action: {
                    UIPasteboard.general.string = self.writeText
                })
                .buttonStyle(PrimaryBtnStyle())
                
                Button("读取剪切板", action: {
                    if UIPasteboard.general.hasStrings {
                        self.readText = UIPasteboard.general.string ?? ""
                        self.showAlert.toggle()
                    }
                })
                .buttonStyle(PrimaryBtnStyle())
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("剪切板内容"),
                        message: Text(self.readText)
                    )
                }
            }
            
        }
        .padding(.horizontal, 10)
        .background(.gray.opacity(0.1))
        .navigationBarTitle("clipboard", displayMode: .inline)
    }
}


struct api_clipboard_Previews: PreviewProvider {
    static var previews: some View {
        api_clipboard()
    }
}
