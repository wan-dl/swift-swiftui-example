//
//  v_DisclosureGroup.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct v_DisclosureGroup: View {
    struct ToggleStates {
        var oneIsOn: Bool = false
        var twoIsOn: Bool = true
    }
    @State private var toggleStates = ToggleStates()
    @State private var topExpanded: Bool = true

    var body: some View {
        DisclosureGroup("Items", isExpanded: $topExpanded) {
            Toggle("Toggle 1", isOn: $toggleStates.oneIsOn)
            Toggle("Toggle 2", isOn: $toggleStates.twoIsOn)
            DisclosureGroup("Sub-items") {
                Text("Sub-item 1")
            }
        }
    }
}

struct v_DisclosureGroup_Previews: PreviewProvider {
    static var previews: some View {
        v_DisclosureGroup()
    }
}
