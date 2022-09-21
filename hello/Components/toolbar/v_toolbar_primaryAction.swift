//
//  v_toolbar_primaryAction.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

fileprivate let pageDesc: String = """
主要操作是当前上下文中更常用的操作。例如，用户单击或点击以在聊天应用程序中撰写新消息的按钮。

在 macOS 和 Mac Catalyst 应用程序中，主要操作的位置是工具栏的前沿。

在 iOS、iPadOS 和 tvOS 中，主要操作的位置是导航栏的后沿。

在 watchOS 中，系统将主要操作置于导航栏下方；用户通过滚动显示动作。
"""

struct v_toolbar_primaryAction: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Group {
                Text("注意页面顶部导航栏尾部。\n\n本页面示例 是对 toolbar placement: .primaryAction 的应用展示。")
                    .font(.callout)

                Text("primaryAction介绍")
                    .font(.title2)
                Text(pageDesc)
                    .font(.callout)
            }
            .foregroundColor(.gray)
            .padding()
            .modifier(buttonViewCodeAndDocs(pageType: "SwiftUI", pageID: "toolbar_primaryAction"))
            
            Spacer()
            
            Text("")
                .toolbar {
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button(action: {}, label: {
                            Label("Add", systemImage: "folder.badge.plus")
                                .foregroundColor(.yellow)
                        })
                        Button(action: {}, label: {
                            Label("Edit", systemImage: "square.and.pencil")
                                .foregroundColor(.yellow)
                        })
                    }
                }
        }
    }
}

struct v_toolbar_primaryAction_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_primaryAction()
    }
}
