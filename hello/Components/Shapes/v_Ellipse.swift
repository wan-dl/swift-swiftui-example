//
//  v_Ellipse.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI

struct v_Ellipse: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Text("以下示例是对 Ellipse() 的应用。")
                .foregroundColor(.gray)
            
            // 示例1
            Ellipse()
                .fill(.green)
                .frame(width: 150, height: 150)
                .overlay(
                    Text("150x150").foregroundColor(.white)
                )
            
            // 示例2
            Ellipse()
                .fill(.green)
                .frame(width: 200, height: 100)
                .overlay(
                    Text("200x100").foregroundColor(.white)
                )
        }
        .navigationTitle("Ellipse()")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Ellipse"))
    }
}

struct v_Ellipse_Previews: PreviewProvider {
    static var previews: some View {
        v_Ellipse()
    }
}
