//
//  v_ScrollView_horizontal.swift
//  HelloSwift
//
//  Created by 1 on 9/26/22.
//

import SwiftUI

struct v_ScrollView_horizontal: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0 ..< 5) { item in
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.blue)
                        .frame(width: 250, height: 200)
                }
            }
            .padding()
        }
        .navigationTitle("ScrollView")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ScrollView_horizontal"))
    }
}

struct v_ScrollView_horizontal_Previews: PreviewProvider {
    static var previews: some View {
        v_ScrollView_horizontal()
    }
}
