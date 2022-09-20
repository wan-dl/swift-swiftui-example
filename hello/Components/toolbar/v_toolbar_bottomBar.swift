//
//  v_toolbar_bottomBar.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

struct v_toolbar_bottomBar: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("注意页面底部工具栏，左右两侧")
                .font(.callout)
                .foregroundColor(.gray)
                .offset(y: 50)
            
            Text("")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
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

struct v_toolbar_bottomBar_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_bottomBar()
    }
}
