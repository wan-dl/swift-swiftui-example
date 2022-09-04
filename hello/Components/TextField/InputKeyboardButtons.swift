//
//  InputKeyboardButtons.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputKeyboardButtons: View {
    @State var user: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                Section("键盘右下角显示继续 .continue") {
                    TextField("placeholder", text: $user)
                        .submitLabel(.continue)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("键盘右下角显示完成 .done") {
                    TextField("placeholder", text: $user)
                        .submitLabel(.done)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("键盘右下角显示前往 .go") {
                    TextField("placeholder", text: $user)
                        .submitLabel(.go)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("键盘右下角显示加入 .join") {
                    TextField("placeholder", text: $user)
                        .submitLabel(.join)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("键盘右下角显示下一项 .next") {
                    TextField("placeholder", text: $user)
                        .submitLabel(.next)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("键盘右下角显示换行 .return") {
                    TextField("placeholder", text: $user)
                        .submitLabel(.return)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("键盘右下角显示路线 .route") {
                    TextField("placeholder", text: $user)
                        .submitLabel(.route)
                        .textFieldStyle(.roundedBorder)
                }

                Section("键盘右下角显示搜索 .search") {
                    TextField("placeholder", text: $user)
                        .submitLabel(.search)
                        .textFieldStyle(.roundedBorder)
                }
                
                Section("键盘右下角显示发送 .send") {
                    TextField("placeholder", text: $user)
                        .submitLabel(.send)
                        .textFieldStyle(.roundedBorder)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle(".submitLabel")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InputKeyboardButtons_Previews: PreviewProvider {
    static var previews: some View {
        InputKeyboardButtons()
    }
}
