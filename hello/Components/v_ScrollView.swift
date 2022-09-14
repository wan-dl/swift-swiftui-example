//
//  ViewScrollView.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_ScrollView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(1..<100) {
                    Text("1 + \($0) = ")
                }
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("ScrollView")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ScrollView"))
    }
}

struct v_ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        v_ScrollView()
    }
}
