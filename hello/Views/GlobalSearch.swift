//
//  HomeSearch.swift
//  HelloSwift
//
//  Created by 1 on 8/27/22.
//

import SwiftUI

struct QueryItem: Identifiable {
    let id = UUID()
    let name: String
}

struct GlobalSearch: View {
    @State private var queryString: String = ""
    @State private var LastQueryList: [QueryItem] = []
    @State private var isSearchHistory: Bool = false
    
    @State private var searchResultForSwift: [LangSwiftItem] = []
    @State private var searchResultForSwiftUI: [LangSwiftUIItem] = []
    @State private var searchResultForApi: [ApiItem] = []
    
//    @FocusState var isFocused: Bool
//    @AccessibilityFocusState private var isFocused2: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("")
                .searchable(text: $queryString, prompt: "搜索", suggestions: {})
                .onChange(of: queryString) { value in
                    self.searchResultForSwift = []
                    self.searchResultForSwiftUI = []
                    self.searchResultForApi = []
                }
                .onSubmit(of: [.text, .search]) {
                    self.searchResultForSwift = []
                    self.searchResultForSwiftUI = []
                    self.searchResultForApi = []
                    gotoSearch()
                }
//                .focused($isFocused)
//                .accessibilityFocused($isFocused2)

            if !LastQueryList.isEmpty && queryString.isEmpty {
                List {
                    Section(header: Text("最近搜索").font(.subheadline)) {
                        ForEach(LastQueryList) {item in
                            Text(item.name)
                                .onTapGesture {
                                    self.queryString = item.name
//                                    self.isFocused = true
//                                    self.isFocused2 = true
                                }
                        }
                    }
                }
                .listStyle(.plain)
            }
            
            
            if !isSearchHistory && queryString.isEmpty && LastQueryList.isEmpty {
                VStack(alignment: .center) {
                    Text("无最近搜索")
                        .font(.title3)
                    Text("在您搜索文章等内容时，会自动添加到最近的搜索。")
                }
                .foregroundColor(.gray)
            }
            
            if !searchResultForSwift.isEmpty || !searchResultForSwiftUI.isEmpty || !searchResultForApi.isEmpty {
                VStack(alignment: .leading, spacing: 20) {
                    List {
                        if !searchResultForSwift.isEmpty {
                            Section(header: Text("Swift Language").textCase(.none)) {
                                ForEach(searchResultForSwift) { item in
                                    NavigationLink(item.name, destination: {
                                        loadLocalHtml(pageTitle: item.name, filedir: "swift/\(item.ndir)", filename: item.nid)
                                    })
                                }
                            }
                        }
                        
                        if !searchResultForSwiftUI.isEmpty {
                            Section(header: Text("SwiftUI").textCase(.none)) {
                                ForEach(searchResultForSwiftUI) { item in
                                    NavigationLink(destination: item.viewname, label: {
                                        Text(item.name)
                                    })
                                }
                            }
                        }
                        
                        if !searchResultForApi.isEmpty {
                            Section(header: Text("框架").textCase(.none)) {
                                ForEach(searchResultForApi) { item in
                                    NavigationLink(destination: item.viewname, label: {
                                        Text(item.name)
                                    })
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("搜索")
        .navigationBarTitleDisplayMode(.large)
        .task() {
            await getDataFromUsersDefaults()
        }
        .onDisappear() {
            saveDataToUserDefaults()
        }
    }
    
    // 搜索
    func gotoSearch() {
        if self.queryString.isEmpty {
            return
        }
        let word = queryString.lowercased()
        
        // 在SwiftUI中搜索
        for i1 in SwiftUIComponentsList {
            for i2 in i1.seas {
                let viewname: String = i2.name.lowercased()
                if viewname.contains(word.lowercased()) {
                    searchResultForSwiftUI.append(i2)
                }
            }
        }
        
        // 在Swift语言中文文档中搜索
        let AllSwift: [LangSwiftItem] = LangSwiftSyntaxList + LangSwiftWelcomeList + LangSwiftReferenceList
        for i in AllSwift {
            let i_name: String = i.name
            let i_en: String = (i.en).lowercased()
            let i_searchKeyword : String = (i.searchKeyword).lowercased()
            if i_name.contains(word) || i_en.contains(word) || i_searchKeyword.contains(word) {
                searchResultForSwift.append(i)
            }
        }
        
        // 在API示例中中搜索
        for x1 in ApiList {
            for x2 in x1.seas {
                let x_name: String = x2.name
                let x_searchKeyword : String = (x2.searchKeyword).lowercased()
                if x_name.contains(word) || x_searchKeyword.contains(word) {
                    searchResultForApi.append(x2)
                }
            }
        }
        
        // 添加到最近搜索
        let tmpList = LastQueryList.map { (obj) -> String in
            return obj.name
        }
        if !tmpList.contains(word) {
            self.LastQueryList.insert(QueryItem(name: self.queryString), at: 0)
            //self.LastQueryList.append(QueryItem(name: self.queryString))
        }
    }
    
    // 从UserDefaults读取数据
    func getDataFromUsersDefaults() async {
        if !LastQueryList.isEmpty {
            return
        }
        do {
            let historyData = UserDefaults.standard.array(forKey: "LastQueryList")
            if historyData != nil {
                for i in historyData! as Array {
                    self.LastQueryList.append(QueryItem(name: i as! String))
                }
            }
        } catch {}
    }
    
    // 保存搜索历史数据到UserDefaults
    func saveDataToUserDefaults() {
        let tmpList = LastQueryList.map { (obj) -> String in
            return obj.name
        }
        if tmpList.isEmpty {
            return
        }
        UserDefaults.standard.set(tmpList, forKey: "LastQueryList")
    }
}

struct HomeSearch_Previews: PreviewProvider {
    static var previews: some View {
        GlobalSearch()
    }
}
