//
//  TextFieldFocus.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputAutoFocus: View {
    @FocusState var isFocused: Bool
    @State private var inputText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("自动聚焦的输入框")
            TextField("...", text: $inputText)
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
