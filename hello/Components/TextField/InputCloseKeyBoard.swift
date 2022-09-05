//
//  InputCloseKeyBoard.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputCloseKeyBoard: View {
    @FocusState var isFocused: Bool
    @State var inputText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            TextField("placeholder", text: $inputText)
                .focused($isFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isFocused = true
                    }
                }
                .textFieldStyle(.roundedBorder)
            
            Button("点击此处关闭键盘", action: {
                closeKeyBoard()
            })
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
        .onTapGesture {
            hideKeyboard()
        }
        .navigationTitle("关闭键盘")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // 方法1: 关闭键盘
    private func closeKeyBoard() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow!.endEditing(true)
    }
    
    // 方法2: 关闭键盘
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct InputCloseKeyBoard_Previews: PreviewProvider {
    static var previews: some View {
        InputCloseKeyBoard()
    }
}
