//
//  v_image_local.swift
//  HelloSwift
//
//  Created by 1 on 9/14/22.
//

import SwiftUI

struct v_image_local: View {
    var body: some View {
        VStack {
            // 图片预先放置在项目Assets目录下
            Image("wuhuan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
        }
        .navigationTitle("本地资源图片")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ImageLocal"))
    }
}

struct v_image_local_Previews: PreviewProvider {
    static var previews: some View {
        v_image_local()
    }
}
