//
//  v_pickerStyle_segmented.swift
//  HelloSwift
//
//  Created by 1 on 9/5/22.
//

import SwiftUI

struct v_pickerStyle_segmented: View {
    @State private var selectedColor: Colors = .white
    
    var body: some View {
        List {
            Section(header: Text("pickerStyle .segmented样式").textCase(.none)) {
                Picker("Colors", selection: $selectedColor) {
                    ForEach(Colors.allCases) { item in
                        Text(item.rawValue.capitalized)
                    }
                }.pickerStyle(.segmented)
            }
        }
        .navigationTitle(".segmented")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_pickerStyle_segmented_Previews: PreviewProvider {
    static var previews: some View {
        v_pickerStyle_segmented()
    }
}
