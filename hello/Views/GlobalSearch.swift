//
//  HomeSearch.swift
//  HelloSwift
//
//  Created by 1 on 8/27/22.
//

import SwiftUI

// 设置 section header样式
extension View {
    fileprivate func sectionTitle() -> some View {
        self.textCase(.none).font(.headline).foregroundColor(.black)
    }
}

struct QueryItem: Identifiable {
    let id = UUID()
    let name: String
}

struct GlobalSearch: View {
    @State private var queryString: String = ""
    @State private var LastQueryList: [QueryItem] = []
    @State private var isSearchHistory: Bool = false
    
    // 历史搜索填充
    @State private var historySearchFill: Bool = true
    
    @State private var searchResultForSwift: [LangSwiftItem] = []
    @State private var searchResultForSwiftUI: [LangSwiftUIItem] = []
    @State private var searchResultForApi: [ApiItem] = []
    
    @State var isStartSearch: Bool = false
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("")
                .searchable(
                    text: $queryString,
                    placement: SearchFieldPlacement.navigationBarDrawer(displayMode: .always),
                    prompt: "搜索",
                    suggestions: {}
                )
                .onChange(of: queryString) { value in
                    self.searchResultForSwift = []
                    self.searchResultForSwiftUI = []
                    self.searchResultForApi = []
                }
                .onChange(of: historySearchFill) { value in
                    gotoSearch()
                }
                .onSubmit(of: [.text, .search]) {
                    self.searchResultForSwift = []
                    self.searchResultForSwiftUI = []
                    self.searchResultForApi = []
                    gotoSearch()
                }
                .focused($isFocused)

            if !LastQueryList.isEmpty && queryString.isEmpty {
                ScrollView {
                    HStack {
                        Text("最近搜索").font(.headline)
                        Spacer()
                        Label("清除", systemImage: "trash")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.gray)
                            .onTapGesture {
                                clearLastQueryList()
                            }
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        ForEach(LastQueryList) {item in
                            Text(item.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 30)
                                .font(.callout)
                                .onTapGesture {
                                    self.queryString = item.name
                                    self.historySearchFill.toggle()
                                    self.isFocused = true
                                }
                            
                            Divider()
                        }
                    }
                }
                .padding()
                
            }
            
            
            if !isSearchHistory && queryString.isEmpty && LastQueryList.isEmpty{
                VStack(alignment: .center) {
                    Text("无最近搜索")
                        .font(.headline)
                        .padding()
                    Text("在您搜索文章等内容时，会自动添加到最近的搜索。")
                        .foregroundColor(.gray)
                }
                .offset(y: -50)
            }
            
            if !searchResultForSwift.isEmpty || !searchResultForSwiftUI.isEmpty || !searchResultForApi.isEmpty {
                VStack(alignment: .leading, spacing: 20) {
                    List {
                        
                        if !searchResultForSwiftUI.isEmpty {
                            Section(header: Text("SwiftUI").sectionTitle()) {
                                ForEach(searchResultForSwiftUI) { item in
                                    NavigationLink(destination: item.viewname, label: {
                                        Text(item.name)
                                    })
                                }
                            }
                        }
                        
                        if !searchResultForSwift.isEmpty {
                            Section(header: Text("Swift Language").sectionTitle()) {
                                ForEach(searchResultForSwift) { item in
                                    NavigationLink(item.name, destination: {
                                        loadLocalHtml(pageTitle: item.name, filedir: "swift/\(item.ndir)", filename: item.nid)
                                    })
                                }
                            }
                        }
                        
                        if !searchResultForApi.isEmpty {
                            Section(header: Text("框架").sectionTitle()) {
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
        self.isStartSearch = true
        
        // 在SwiftUI中搜索
        for i1 in SwiftUIAllIComponentsList {
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
        addLastQueryList(name: word)
    }
    
    // 添加到最近搜索
    func addLastQueryList(name: String) {
        let tmpList = self.LastQueryList.map { (obj) -> String in
            return obj.name
        }
        if !tmpList.contains(name) {
            self.LastQueryList.insert(QueryItem(name: name), at: 0)
            //self.LastQueryList.append(QueryItem(name: self.queryString))
        }
    }
    
    // 清除搜索
    func clearLastQueryList() {
        self.LastQueryList = []
        UserDefaults.standard.removeObject(forKey: "LastQueryList")
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
