//
//  v_image_AsyncImage.swift
//  HelloSwift
//
//  Created by 1 on 9/14/22.
//

import SwiftUI

struct v_image_AsyncImage: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://ydlunacommon-cdn.nosdn.127.net/abc2e00ba59ece4101a89a01cce818da.png")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            
            Text("备注：本图片是采用AsyncImage从网络下载, AsyncImage适用于iOS 15.0+")
                .font(.footnote)
                .padding()
        }
        .navigationTitle("使用AsyncImage下载图片")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ImageAsyncImage"))
    }
}

struct v_image_AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        v_image_AsyncImage()
    }
}
