//
//  InputOn.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

struct InputOn: View {
    @State private var nickname: String = ""
        
    var body: some View {
        VStack(alignment: .leading) {
            TextField(
                "昵称",
                text: $nickname,
                onEditingChanged: { (isBegin) in
                    if isBegin {
                        print(":: onEditingChanged 开始输入")
                    } else {
                        print(":: onEditingChanged 完成输入")
                    }
                },
                onCommit: {
                    print(":: onCommit")
                }
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .submitScope() // 限定作用域
            .onSubmit {
                print(":: onSubmit")
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("TextField on")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InputOn_Previews: PreviewProvider {
    static var previews: some View {
        InputOn()
    }
}
