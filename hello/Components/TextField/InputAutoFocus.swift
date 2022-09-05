//
//  TextFieldFocus.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

private let intro = "简介：SwiftUI FocusState 属性包装器，可以帮助我们判断该视图内的 TextField 是否获得焦点。通过focused将FocusState与特定的 TextField 关联起来"

struct InputAutoFocus: View {
    @FocusState var isFocused: Bool
    @State private var inputText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text(intro)
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            Text("自动聚焦的输入框")
            TextField("placeholder", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .focused($isFocused)
                .onChange(of: isFocused) { value in
                    print("------------\(value)")
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isFocused = true
                    }
                }
            
            Spacer()
        }
        .padding()
        .navigationTitle(".focused")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InputAutoFocus_Previews: PreviewProvider {
    static var previews: some View {
        InputAutoFocus()
    }
}
