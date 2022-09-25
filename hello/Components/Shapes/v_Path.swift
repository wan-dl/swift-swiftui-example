//
//  v_path.swift
//  HelloSwift
//
//  Created by 1 on 9/25/22.
//

import SwiftUI

struct v_Path: View {
    var body: some View {
        VStack {
            Text("以下示例，是对Path的应用")
                .foregroundColor(.gray)
                .frame(height: 100, alignment: .center)
            
            Path {
                 path in
                       path.addEllipse(in: CGRect(x: 100, y: 80, width: 200, height: 200))

                       path.addRoundedRect(in: CGRect(x: 100, y: 120, width: 200, height: 200), cornerSize: CGSize(width: 10, height: 10))

                       path.addEllipse(in: CGRect(x: 100, y: 210, width: 200, height: 200))
            }
            .fill(Color.pink)
            
        }
        .navigationTitle("Path")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Path"))
    }
}

struct v_Path_Previews: PreviewProvider {
    static var previews: some View {
        v_Path()
    }
}
