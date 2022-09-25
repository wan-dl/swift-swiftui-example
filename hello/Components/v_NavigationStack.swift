//
//  v_NavigationStack.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI

struct v_NavigationStack: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("在App内，对NavigationStack，呈现肉眼可观察的效果，并不容易(因为App本身就使用了NavigationStack，在此页面使用会导致闪退)。")
            
            Text("对于NavigationStack，建议直接观看官方文档。")
            
            NavigationLink("NavigationStack 文档", destination: {
                loadOpenUrl(url: "https://developer.apple.com/documentation/swiftui/NavigationStack")
            })
            
            Text("右上角【示例源码】，对于NavigationStack的用法，写了一个简单的demo。请新建一个项目，拷贝源码，直接查看。")
                .font(.headline)
            
            Spacer()
        }
        .padding()
        .navigationTitle("NavigationStack")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "NavigationStack"))
    }
}

struct v_NavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        v_NavigationStack()
    }
}
