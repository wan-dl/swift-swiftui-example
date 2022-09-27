//
//  api_HealthKit.swift
//  HelloSwift
//
//  Created by 1 on 8/8/22.
//

import SwiftUI

struct api_HealthKit: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("关于HealthKit库的应用，本页面右上角 示例源码，包含一个简单的demo，可以参考下。\n\n更多参考官方的文档教程。")
                .offset(y: 50)
            Spacer()
        }
        .navigationTitle("HealthKit - 健康")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "HealthKit"))
    }
}


struct api_HealthKit_Previews: PreviewProvider {
    static var previews: some View {
        api_HealthKit()
    }
}
