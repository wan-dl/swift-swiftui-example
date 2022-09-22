//
//  v_position.swift
//  HelloSwift
//
//  Created by 1 on 9/22/22.
//

import SwiftUI

struct v_position: View {
    var body: some View {
        VStack {
            Text("如下所示，红色图标，是使用.position(x: 100, y: 100)的效果。")
                .foregroundColor(.gray)
                .font(.callout)
                .padding()
                
            Image(systemName: "figure.climbing")
                .foregroundColor(.red)
                .font(.largeTitle)
                .position(x: 100, y: 100)
        }
        .navigationTitle("position")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "position"))
    }
}

struct v_position_Previews: PreviewProvider {
    static var previews: some View {
        v_position()
    }
}
