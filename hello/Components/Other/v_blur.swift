//
//  v_blur.swift
//  HelloSwift
//
//  Created by 1 on 9/3/22.
//

import SwiftUI

struct v_blur: View {
    var body: some View {
        VStack {
            Text("说明：本页面示例，主要代码为：.blur(radius: 3.0) ")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            Text("好好休息，健康第一")
                .blur(radius: 3.0)
            
            Image("code")
                .frame(width: 128, height: 128)
                .blur(radius: 10.0)
        }
        .navigationTitle(".blur")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "blur"))
    }
}

struct v_blur_Previews: PreviewProvider {
    static var previews: some View {
        v_blur()
    }
}
