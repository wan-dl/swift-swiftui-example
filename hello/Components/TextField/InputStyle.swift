//
//  InputStyle.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

struct InputStyle: View {
    @State var inputText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Section(".automatic") {
                TextField("placeholder", text: $inputText)
                    .textFieldStyle(.automatic)
            }
            
            Section(".plain") {
                TextField("placeholder", text: $inputText)
                    .textFieldStyle(.plain)
            }
            
            Section(".roundedBorder") {
                TextField("placeholder", text: $inputText)
                    .textFieldStyle(.roundedBorder)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("textFieldStyle")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InputStyle_Previews: PreviewProvider {
    static var previews: some View {
        InputStyle()
    }
}
