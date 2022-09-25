//
//  v_default_PickerStyle.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

enum Colors4: String, CaseIterable, Identifiable {
    case yellow
    case blue
    case white
    var id: Self { self }
}

struct v_pickerStyle_default: View {
    @State private var selectedColor: Colors4 = .white
    
    var body: some View {
        List {
            Section(header: Text("默认样式")) {
                Picker("Colors", selection: $selectedColor) {
                    ForEach(Colors4.allCases) { item in
                        Text(item.rawValue.capitalized)
                    }
                }
            }
        }
        .navigationTitle("默认样式")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "pickerStyleDefault"))
    }
}

struct v_pickerStyle_default_Previews: PreviewProvider {
    static var previews: some View {
        v_pickerStyle_default()
    }
}
