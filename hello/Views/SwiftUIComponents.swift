//
//  Controls.swift
//  format
//
//  Created by 1 on 7/26/22.
//  Updated by 1 on 2022-08-20 增加搜索
//

import SwiftUI


enum ViewName {
    case text
}

struct ComponentsView: View {
    
    @State var searchKeyword: String = ""
    
    var body: some View {
        VStack {
            List(searchResults, id: \.id) { item in
                Section(header: Text(item.name).textCase(.none)) {
                    ForEach(item.seas, id:\.id) { item2 in
                        //NavigationLink(item2.name, destination: item2.viewname)
                        NavigationLink(destination: item2.viewname, label: {
                            Text(item2.name)
                                .lineLimit(1)
                            Text(item2.available)
                                .font(.caption)
                                .foregroundColor(.gray)
                        })
                    }
                }
            }
            .listStyle(.insetGrouped)
            .searchable(text: $searchKeyword, placement: SearchFieldPlacement.automatic, prompt: "搜索")
        }
        .navigationTitle("SwiftUI")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
    
    // 根据搜索关键字，返回搜索结果
    var searchResults: [CInfo] {
        if searchKeyword.isEmpty {
            return SwiftUIComponentsList
        }
        var result: [CInfo] = []
        for i1 in SwiftUIComponentsList {
            var tmp = CInfo(name: i1.name, seas: [])
            for i2 in i1.seas {
                let viewname: String = i2.name.lowercased()
                if viewname.contains(searchKeyword.lowercased()) {
                    tmp.seas.append(i2)
                }
            }
            if !tmp.seas.isEmpty {
                result.append(tmp)
            }
        }
        return result
    }
}

struct ComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ComponentsView()
    }
}
