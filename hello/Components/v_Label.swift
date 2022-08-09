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
            Section(header: Text("Label: 图标 + 文本").font(.title3).foregroundColor(.gray)) {
                Label("Lightning", systemImage: "bolt.fill")
            }
            
            Section(header: Text("Label: .iconOnly 仅图标").font(.title3).foregroundColor(.gray)) {
                HStack(spacing: 20) {
                    Label("Rain", systemImage: "cloud.rain")
                    Label("Snow", systemImage: "snow")
                    Label("Sun", systemImage: "sun.max")
                }
                .labelStyle(.iconOnly)
            }
        }
        .navigationBarTitle(Text("Label"), displayMode: .inline)
    }
}

struct v_Label_Previews: PreviewProvider {
    static var previews: some View {
        v_Label()
    }
}
