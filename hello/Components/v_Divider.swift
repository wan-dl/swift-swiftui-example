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
            
            Text("如上所示，分割线 即为 Divider() 效果。")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
        }
        .padding()
        .navigationTitle("Divider")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_Divider_Previews: PreviewProvider {
    static var previews: some View {
        v_Divider()
    }
}
