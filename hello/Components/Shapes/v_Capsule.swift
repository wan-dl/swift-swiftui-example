//
//  v_Capsule.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI

struct v_Capsule: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Text("以下示例是对 Capsule() 的应用。")
                .foregroundColor(.gray)
            
            // 示例1
            Section(header: Text("示例1：Capsule() 150x150")) {
                Capsule()
                    .fill(.pink)
                    .frame(width: 150, height: 150)
            }
            
            // 示例2
            Section(header: Text("示例2：Capsule()结合offset、rotationEffect的应用 ")) {
                Capsule()
                    .foregroundColor(.blue)
                    .frame(width : 120, height: 60)
                    .offset(x: 0, y: 60)
                    .rotationEffect(.degrees(20))
                    .opacity(0.75)
            }
        }
        .padding()
        .navigationTitle("Capsule()")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Capsule"))
    }
}

struct v_Capsule_Previews: PreviewProvider {
    static var previews: some View {
        v_Capsule()
    }
}
