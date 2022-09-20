//
//  v_toolbar_navigation.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

struct v_toolbar_navigation: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("注意页面顶部导航栏尾部。\n\n本页面示例 是对 toolbar placement: .navigation 的应用展示。")
                .font(.callout)
                .foregroundColor(.gray)
                .offset(y: 50)
            
            Text("")
                .toolbar {
                    ToolbarItemGroup(placement: .navigation) {
                        Button(action: {}, label: {
                            Label("Add", systemImage: "folder.badge.plus")
                                .foregroundColor(.yellow)
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Label("Edit", systemImage: "square.and.pencil")
                                .foregroundColor(.yellow)
                        })
                    }
                }
            
            Spacer()
        }
    }
}

struct v_toolbar_navigation_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_navigation()
    }
}
