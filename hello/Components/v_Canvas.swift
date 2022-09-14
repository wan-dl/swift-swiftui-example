//
//  PagesCanvas.swift
//  format
//
//  Created by 1 on 7/29/22.
//

import SwiftUI

struct v_Canvas: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                context.stroke(
                    Path(ellipseIn: CGRect(origin: .zero, size: size)),
                    with: .color(.green),
                    lineWidth: 4)
            }
            .frame(width: 300, height: 200)
            .border(Color.blue)
        }
        .navigationTitle("Canvas")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Canvas"))
    }
}

struct v_Canvas_Previews: PreviewProvider {
    static var previews: some View {
        v_Canvas()
    }
}
