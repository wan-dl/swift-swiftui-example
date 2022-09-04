//
//  InputAccentColor.swift
//  HelloSwift
//
//  Created by 1 on 9/4/22.
//

import SwiftUI

struct InputAccentColor: View {
    @State var inputText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Section("光标颜色 .accentColor()") {
                TextField("光标显示显示红色", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .accentColor(.red)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("accentColor")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InputAccentColor_Previews: PreviewProvider {
    static var previews: some View {
        InputAccentColor()
    }
}
