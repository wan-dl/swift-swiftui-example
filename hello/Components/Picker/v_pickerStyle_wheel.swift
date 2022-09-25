//
//  v_wheelPicker.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

enum Colors5: String, CaseIterable, Identifiable {
    case yellow
    case blue
    case white
    var id: Self { self }
}

struct v_pickerStyle_wheel: View {
    @State private var isOpen: Bool = false
    @State private var selectedColor: Colors5 = .white
    
    var body: some View {
        List {
            Section(header: Text("pickerStyle .wheel样式").textCase(.none)) {
                Picker("Colors", selection: $selectedColor) {
                    ForEach(Colors5.allCases) { item in
                        Text(item.rawValue.capitalized)
                    }
                }.pickerStyle(.wheel)
            }
        }
        .navigationTitle(".wheel")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "pickerStyleWheel"))
    }
}

struct v_pickerStyle_wheel_Previews: PreviewProvider {
    static var previews: some View {
        v_pickerStyle_wheel()
    }
}
