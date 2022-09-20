//
//  TutorialSwiftLanguage.swift
//  HelloSwift
//
//  Created by 1 on 9/8/22.
//

import SwiftUI

let pageDesc = "本中文文档，为Swift 5.5 版本翻译。当前Swift最新版本是 5.7. "
let license = "本教程基于开源协议 Creative Commons Attribution 4.0 International (CC BY 4.0) License。地址:"
let githubURLName = "Github the-swift-programming-language-in-chinese"
let githubURL = "https://github.com/SwiftGGTeam/the-swift-programming-language-in-chinese"
let swiftOfficialWebsite = "https://docs.swift.org/swift-book"

struct TutorialSwiftLanguage: View {
    @State var searchKeyword: String = ""
    @State var isOpenSearch: Bool = false
    
    var body: some View {
        VStack {
            List {
                headView
                
                SwiftWelcomeView
                SwiftSyntaxView
                SwfitReferenceView
                
                footView
            }
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        SwiftSyntaxSearch()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    })
                }
            }
        }
        .navigationTitle("Swift")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var headView: some View {
        HStack() {
            Image("icon_swift")
                .resizable(resizingMode: .stretch)
                .frame(width: 25, height: 25)
                .offset(y: -10)
            VStack(alignment: .leading) {
                Text(pageDesc)
                    .lineSpacing(6)
                    .font(.callout)
            }
        }
    }
    
    var SwiftWelcomeView: some View {
        Section(header: Text("Welcome to Swift").textCase(.none)) {
            NavigationLink("Swift 5.7英文文档", destination: {
                loadOpenUrl(url: swiftOfficialWebsite, title: "Swift")
            })
            ForEach(LangSwiftWelcomeList, id: \.id) { item in
                NavigationLink(destination: {
                    //readMarkDownFile(mdDir: "swift/welcome", mdPath: item.nid, mdTitle: item.name)
                    loadLocalHtml(pageTitle: item.name, filedir: "swift/welcome", filename: item.nid)
                }, label: {
                    Text(item.name)
                })
            }
        }
    }
    
    var SwiftSyntaxView: some View {
        Section(header: Text("Swift教程").textCase(.none)) {
            ForEach(LangSwiftSyntaxList, id: \.id) { item in
                NavigationLink(destination: {
                    //readMarkDownFile(mdDir: "swift/guide", mdPath: item.nid, mdTitle: item.name)
                    loadLocalHtml(pageTitle: item.name, filedir: "swift/guide", filename: item.nid)
                }, label: {
                    Text(item.name)
                    Text(item.en)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                })
            }
        }
    }
    
    var SwfitReferenceView: some View {
        Section(header: Text("Swift语言参考").textCase(.none)) {
            ForEach(LangSwiftReferenceList, id: \.id) { item in
                NavigationLink(destination: {
                    //readMarkDownFile(mdDir: "swift/reference", mdPath: item.nid, mdTitle: item.name)
                    loadLocalHtml(pageTitle: item.name, filedir: "swift/reference", filename: item.nid)
                }, label: {
                    Text(item.name)
                    Text(item.en)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                })
            }
        }
    }
    
    var footView: some View {
        VStack(spacing: 6) {
            Text(license)
                .lineSpacing(5)
            Link(destination:  URL(string: githubURL)!, label: {
                Text(githubURLName)
                    .lineLimit(1)
            })
        }
        .font(.footnote)
    }
    
}

struct SwiftSyntaxSearch: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var isSearch: Bool = false
    @State private var searchKeyword: String = ""
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("搜索Swift语法", text: $searchKeyword)
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
            
            if !LangSwiftSyntaxListResults.isEmpty {
                List{
                    Section(header: Text("搜索结果").font(.subheadline)) {
                        ForEach(LangSwiftSyntaxListResults, id: \.id) { item in
                            NavigationLink(destination: {
                                loadLocalHtml(pageTitle: item.name, filedir: "swift/\(item.ndir)", filename: item.nid)
                            }, label: {
                                Text(item.name)
                                    .font(.body)
                                    .foregroundColor(.black)
                                    
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
    
    var LangSwiftSyntaxListResults: [LangSwiftItem] {
        if searchKeyword.isEmpty {
            return []
        }
        var result: [LangSwiftItem] = []
        let word = searchKeyword.lowercased()
        for i in LangSwiftSyntaxList {
            let i_name: String = i.name
            let i_en: String = (i.en).lowercased()
            let i_searchKeyword : String = (i.searchKeyword).lowercased()
            if i_name.contains(word) || i_en.contains(word) || i_searchKeyword.contains(word) {
                result.append(i)
            }
        }
        return result
    }
}

struct TutorialSwiftLanguage_Previews: PreviewProvider {
    static var previews: some View {
        TutorialSwiftLanguage()
    }
}
