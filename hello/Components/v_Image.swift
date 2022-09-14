//
//  ViewImage.swift
//  format
//
//  Created by 1 on 7/29/22.
//  update by 1 on 2022-08-23
//

import SwiftUI

struct v_Image: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack {
            List {
                NavigationLink("SF符号", destination: v_image_SF())
                NavigationLink("Assets图片", destination: v_image_local())
                NavigationLink("使用URLSession下载图片", destination: v_image_URLSession())
                NavigationLink("使用AsyncImage下载图片", destination: v_image_AsyncImage())
            }
        }
        .navigationTitle("Image")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 使用Bundle方式加载图片
struct UseBundleImageView: View {
    var body: some View {
        Group {
            if let resBundlePath = Bundle.main.path(forResource: "Resources", ofType: "bundle"),
                let resBundle = Bundle(path: resBundlePath),
                let uiImage = UIImage(named: "2022.jpeg", in: resBundle, with: nil){
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .clipped()
            } else {
                Color.red
            }
        }
    }
}

struct v_Image_Previews: PreviewProvider {
    static var previews: some View {
        v_Image()
    }
}
