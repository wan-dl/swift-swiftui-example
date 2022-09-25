//
//  v_NavigationView.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI


struct v_NavigationView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("在App内，对NavigationView，呈现肉眼可观察的效果，并不容易。对于NavigationView，建议直接观看官方文档。")
            
            Text("另外，NavigationView本身限制颇多，一些基本功能，比如返回根视图、向堆栈添加任意视图、返回任意层级视图，这些NavigationView本身无法实现。")
            
            Text("iOS 16.0+, 建议直接使用NavigationStack")
            
            NavigationLink("navigationview 文档", destination: {
                loadOpenUrl(url: "https://developer.apple.com/documentation/swiftui/navigationview")
            })
            
            Spacer()
        }
        .padding()
        .navigationTitle("NavigationView")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        v_NavigationView()
    }
}
