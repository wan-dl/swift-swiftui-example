//
//  v_pickerStyle_menu.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

enum Colors3: String, CaseIterable, Identifiable {
    case yellow
    case blue
    case white
    var id: Self { self }
}

struct v_pickerStyle_menu: View {
    @State private var selectedColor: Colors3 = .white
    
    var body: some View {
        List {
            Section(header: Text("pickerStyle .menu样式").textCase(.none)) {
                Picker("Colors", selection: $selectedColor) {
                    ForEach(Colors3.allCases) { item in
                        Text(item.rawValue.capitalized)
                    }
                }.pickerStyle(.menu)
            }
        }
        .navigationTitle(".menu")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "pickerStyleMenu"))
    }
}

struct v_pickerStyle_menu_Previews: PreviewProvider {
    static var previews: some View {
        v_pickerStyle_menu()
    }
}
