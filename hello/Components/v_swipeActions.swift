//
//  v_swipeActions.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct FruitItem: Identifiable {
    let id = UUID()
    let name:String
}

var ChinaFruits: [FruitItem] = [
    FruitItem(name: "apple"),
    FruitItem(name: "watermelon"),
    FruitItem(name: "grape")
]

struct v_swipeActions: View {
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
                
                Section(header: Text("List swipeActions使用").textCase(.none)) {
                    ForEach(ChinaFruits, id: \.id) {item in
                        Text(item.name)
                            .swipeActions(edge: .trailing) {
                                Button("喜欢", action: {})
                                    .tint(.red)
                                
                                Button("购买", action: {})
                                    .tint(.green)
                            }
                    }
                }
            }
        }
        .navigationTitle("swipeActions")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "swipeActions"))
    }
}

struct v_swipeActions_Previews: PreviewProvider {
    static var previews: some View {
        v_swipeActions()
    }
}
