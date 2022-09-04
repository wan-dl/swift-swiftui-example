//
//  InputCloseKeyBoard.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputCloseKeyBoard: View {
    @State var inputText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Section("点击此处关闭键盘") {
                TextField("......", text: $inputText)
                    .textFieldStyle(.roundedBorder)
            }
            
            Spacer()
        }
        .padding()
        .submitScope()
        .onTapGesture {
            closeKeyBoard()
        }
        .navigationTitle("关闭键盘")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // 点击空白处关闭键盘
    private func closeKeyBoard() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow!.endEditing(true)
    }
}

struct InputCloseKeyBoard_Previews: PreviewProvider {
    static var previews: some View {
        InputCloseKeyBoard()
    }
}
