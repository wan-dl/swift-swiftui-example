//
//  v_toolbar_automatic.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

fileprivate let pageDesc:String = """
本页面示例 是对 toolbar placement: .automatic 的应用展示。

automatic 系统会根据平台、尺寸等级或其他物品的存在等多种因素自动放置。

在 macOS 和 Mac Catalyst 应用程序中，系统将项目按照从前到后的顺序放置在当前工具栏部分。在 watchOS 上，只有第一项出现，固定在导航栏下方。

在 iPadOS 中，如果导航栏支持自定义，系统会将项目放置在导航栏的中心。否则，它将项目放置在导航栏的尾随位置。

在 iOS 和 tvOS 中，系统将项目放置在导航栏的尾随位置。

在 iOS、iPadOS 和 macOS 中，系统在确定要在工具栏中呈现多少项目时，会使用工具栏的可用空间。如果不是所有项目都适合可用空间，则可以创建溢出菜单并将剩余项目放置在该菜单中。

"""
struct v_toolbar_automatic: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(pageDesc)
                .font(.callout)
                .foregroundColor(.gray)
                .padding()
                .modifier(buttonViewCodeAndDocs(pageType: "SwiftUI", pageID: "toolbar_automatic"))
            Spacer()
            
            Text("")
                .toolbar {
                    ToolbarItemGroup(placement: .automatic) {
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
        }
    }
}

struct v_toolbar_automatic_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_automatic()
    }
}
