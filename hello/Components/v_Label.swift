//
//  v_Label.swift
//  format
//
//  Created by 1 on 7/27/22.
//

import SwiftUI

struct v_Label: View {
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            
            Section(header: Text("默认语法，文本 + 图标").textCallout()) {
                Label("Lightning", systemImage: "bolt.fill")
                
                Label("Lightning", systemImage: "cloud.bolt.fill")
                    .labelStyle(.titleAndIcon)
            }
            
            Section(header: Text(".iconOnly 仅显示图标").textCallout()) {
                HStack(spacing: 20) {
                    Label("Rain", systemImage: "cloud.rain")
                    Label("Snow", systemImage: "snow")
                }
                .labelStyle(.iconOnly)
            }
        }
        .navigationBarTitle("Label")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Label"))
    }
}

struct v_Label_Previews: PreviewProvider {
    static var previews: some View {
        v_Label()
    }
}
