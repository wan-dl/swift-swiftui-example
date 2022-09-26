//
//  v_ScrollView_vertical.swift
//  HelloSwift
//
//  Created by 1 on 9/26/22.
//

import SwiftUI

struct v_ScrollView_vertical: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0 ..< 20) { item in
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.white)
                        .frame(height: 150)
                        .overlay(
                            Text("图形 - \(item)")
                        )
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .backgroundColor(.gray.opacity(0.2))
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationTitle("ScrollView")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ScrollView_vertical"))
    }
}

struct v_ScrollView_vertical_Previews: PreviewProvider {
    static var previews: some View {
        v_ScrollView_vertical()
    }
}
