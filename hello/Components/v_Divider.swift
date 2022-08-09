//
//  v_Divider.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_Divider: View {
    var body: some View {
        VStack {
            Text("标题")
                .font(.title)
            
            Divider()
            
            Text("A visual element that can be used to separate other content.")
                .font(.body)
        }
        .navigationBarTitle(Text("Divider"), displayMode: .inline)
    }
}

struct v_Divider_Previews: PreviewProvider {
    static var previews: some View {
        v_Divider()
    }
}
