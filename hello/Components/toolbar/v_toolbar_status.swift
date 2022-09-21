//
//  v_toolbar_status.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

struct v_toolbar_status: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("注意页面底部中间位置。\n本页面示例 是对 toolbar placement: .status 的应用展示。")
                .font(.callout)
                .foregroundColor(.gray)
                .padding()
                .modifier(buttonViewCodeAndDocs(pageType: "SwiftUI", pageID: "toolbar_status"))
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
    }
}

struct v_toolbar_status_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar_status()
    }
}
