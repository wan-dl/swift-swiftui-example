//
//  v_pickerStyle_inline.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

enum Colors1: String, CaseIterable, Identifiable {
    case yellow
    case blue
    case white
    var id: Self { self }
}

struct v_pickerStyle_inline: View {
    @State private var selectedColor: Colors1 = .white
    
    var body: some View {
        List {
            Section(header: Text("PickerStyle inline样式").textCase(.none)) {
                Picker("Colors", selection: $selectedColor) {
                    ForEach(Colors1.allCases) { item in
                        Text(item.rawValue.capitalized)
                    }
                }
                .pickerStyle(.inline)
            }
        }
        .navigationTitle(".inline")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "pickerStyleInline"))
    }
}

struct v_pickerStyle_inline_Previews: PreviewProvider {
    static var previews: some View {
        v_pickerStyle_inline()
    }
}
