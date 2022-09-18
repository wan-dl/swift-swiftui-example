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

struct SwiftUIComponentsView: View {
    
    @State var searchKeyword: String = ""
    @State var isDelay: Bool = false
    var body: some View {
        VStack {
            List {
                Section() {
                    NavigationLink(destination: TutorialSwiftUI(), label: {
                        Label("SwiftUI是一种使用Swift语言在苹果设备上构建用户界面的创新且简单的方式...", systemImage: "swift")
                            .lineLimit(2)
                    })
                }
                ForEach(SwiftUIComponentsList, id: \.id) { item in
                    Section(header: Text(item.name).textCase(.none)) {
                        ForEach(item.seas, id:\.id) { item2 in
                            NavigationLink(destination: item2.viewname, label: {
                                Text(item2.name)
                                    .lineLimit(1)
                                if item2.available != "iOS 13.0+" && !item2.available.isEmpty {
                                    Text(item2.available)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            })
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
//            .searchable(text: $searchKeyword, placement: SearchFieldPlacement.automatic, prompt: "搜索")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        SwiftUISearch()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    })
                }
            }
        }
        .navigationTitle("SwiftUI")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
//        .safeAreaInset(edge: .bottom, content: {
//            Color.clear.frame(height: 44)
//        })
    }
    
    // 根据搜索关键字，返回搜索结果
//    var searchResults: [CInfo] {
//        if searchKeyword.isEmpty {
//            return SwiftUIComponentsList
//        }
//        var result: [CInfo] = []
//        for i1 in SwiftUIComponentsList {
//            var tmp = CInfo(name: i1.name, seas: [])
//            for i2 in i1.seas {
//                let viewname: String = i2.name.lowercased()
//                if viewname.contains(searchKeyword.lowercased()) {
//                    tmp.seas.append(i2)
//                }
//            }
//            if !tmp.seas.isEmpty {
//                result.append(tmp)
//            }
//        }
//        return result
//    }
}

struct SwiftUISearch: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var isSearch: Bool = false
    @State private var searchKeyword: String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("搜索SwiftUI组件", text: $searchKeyword)
                    .focused($isFocused)
                    .submitLabel(.search)
                    .padding(.horizontal, 10)
                    .frame(height: 35)
                    .background(.white)
                    .cornerRadius(10)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isFocused = true
                        }
                    }

                Spacer()

                Button(action: {
                    self.dismiss()
                }, label: {
                    Text("取消")
                        .foregroundColor(.black.opacity(0.8))
                })
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            if !searchResults.isEmpty {
                List{
                    Section(header: Text("搜索结果").font(.subheadline)) {
                        ForEach(searchResults, id: \.id) { item in
                            NavigationLink(destination: {
                                item.viewname
                            }, label: {
                                Text(item.name)
                            })
                        }
                    }
               }
                .listStyle(.plain)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(.gray.opacity(0.2))
        .navigationBarHidden(true)
        .ignoresSafeArea(edges:.bottom)
    }
    
    // 根据搜索关键字，返回搜索结果
    var searchResults: [LangSwiftUIItem] {
        if searchKeyword.isEmpty {
            return []
        }
        var result: [LangSwiftUIItem] = []
        for i1 in SwiftUIComponentsList {
            for i2 in i1.seas {
                let viewname: String = i2.name.lowercased()
                if viewname.contains(searchKeyword.lowercased()) {
                    result.append(i2)
                }
            }
        }
        return result
    }
}


struct SwiftUIComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIComponentsView()
    }
}
