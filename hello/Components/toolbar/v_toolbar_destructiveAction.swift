//
//  v_toolbar_destructiveAction.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

struct v_toolbar_destructiveAction: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("注意页面顶部导航栏。\n\n本页面示例 是对 toolbar placement: .destructiveAction 的应用展示。")
                .font(.callout)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text("")
                .toolbar {
                    ToolbarItemGroup(placement: .destructiveAction) {
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
        .padding()
    }
}

struct v_toolbar_destructiveAction_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_destructiveAction()
    }
}
