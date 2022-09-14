//
//  v_pickerStyle_menu.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

struct v_pickerStyle_menu: View {
    @State private var selectedColor: Colors = .white
    
    var body: some View {
        List {
            Section(header: Text("pickerStyle .menu样式").textCase(.none)) {
                Picker("Colors", selection: $selectedColor) {
                    ForEach(Colors.allCases) { item in
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
