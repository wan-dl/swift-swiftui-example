//
//  v_image_SF.swift
//  HelloSwift
//
//  Created by 1 on 9/14/22.
//

import SwiftUI

struct v_image_SF: View {
    var body: some View {
        VStack {
            Image(systemName: "leaf.fill")
                .foregroundColor(.green)
        }
        .navigationTitle("SF符号")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ImageSF"))
    }
}

struct v_image_SF_Previews: PreviewProvider {
    static var previews: some View {
        v_image_SF()
    }
}
