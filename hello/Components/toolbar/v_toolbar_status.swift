//
//  v_toolbar_status.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

struct v_toolbar_status: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("注意页面底部中间位置。\n本页面示例 是对 toolbar placement: .status 的应用展示。")
                .font(.callout)
                .foregroundColor(.gray)
                .offset(y: 50)
            Spacer()
            
            Text("")
                .toolbar {
                    ToolbarItemGroup(placement: .status) {
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
        .padding()
    }
}

struct v_toolbar_status_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_status()
    }
}
