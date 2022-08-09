//
//  p_swipeActions.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct p_swipeActions: View {
    var body: some View {
        VStack {
            List {
                Section(header: Text("从开头部分右滑")) {
                    Text("apple.com")
                        .swipeActions(edge: .leading) {
                            Button {} label: {
                                Label("Pin", systemImage: "pin")
                            }
                            .tint(.green)
                        }
                }
                
                Section(header: Text("从尾部向左滑")) {
                    Text("apple.com")
                        .swipeActions(edge: .trailing) {
                            Button("删除", action: {})
                                .tint(.red)
                            
                            Button("不显示", action: {})
                                .tint(.yellow)
                            
                            Button("不再关注", action: {})
                                .tint(.gray)
                        }
                }
            }
        }
        .navigationBarTitle("swipeActions示例", displayMode: .inline)
    }
}

struct p_swipeActions_Previews: PreviewProvider {
    static var previews: some View {
        p_swipeActions()
    }
}
