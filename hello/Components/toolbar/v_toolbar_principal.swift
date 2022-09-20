//
//  v_toolbar_principal.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

fileprivate var pageDesc:String = """
注意页面顶部，中间部分。

本页面示例，是对 toolbar ToolbarItemGroup(placement: .principal) 的展示。

在 iOS、iPadOS 和 tvOS 中，系统将主要项目放置在导航栏的中心。此项目优先于通过 指定的标题。View/navigationTitle"
"""

struct v_toolbar_principal: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text(pageDesc)
                .font(.callout)
                .foregroundColor(.gray)
                .offset(y: 50)
            
            Text("")
                .toolbar {
                    ToolbarItemGroup(placement: .principal) {
                        HStack {
                            Text("同城")
                            Text("关注")
                            Text("搜索")
                        }
                    }
                }
            
            Spacer()
        }
        .padding()
    }
}

struct v_toolbar_principal_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_principal()
    }
}
