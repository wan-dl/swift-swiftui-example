//
//  v_toolbar_secondaryAction.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

fileprivate let pageDesc:String = """
注意页面顶部导航栏尾部。

本页面示例 是对 toolbar placement: .secondaryAction 的应用展示。

.secondaryAction 是iOS 16.0新增的方法，只有手机系统为iOS 16.0+时，才能看到效果
"""

struct v_toolbar_secondaryAction: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text(pageDesc)
                .font(.callout)
                .foregroundColor(.gray)
            
            Spacer()
            
            if #available(iOS 16.0, *) {
                Text("")
                    .toolbar {
                        ToolbarItemGroup(placement: .secondaryAction) {
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
        .padding()
    }
}

struct v_toolbar_secondaryAction_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_secondaryAction()
    }
}
