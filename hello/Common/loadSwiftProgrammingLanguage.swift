//
//  loadSwiftProgrammingLanguage.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI
import WebKit

fileprivate struct loadLocalHtmlFileForSwift: UIViewRepresentable {
    var filename: String
    var filedir: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let fdir = filedir.isEmpty ? "/Resouces.bundle/" : "/Resouces.bundle/\(filedir)/"
        let fileURL = Bundle.main.url(forResource: filename, withExtension: ".html", subdirectory: fdir)
        if fileURL == nil {
            return
        }
        
        uiView.loadFileURL(fileURL!, allowingReadAccessTo: fileURL!)

        let request = URLRequest(url: fileURL!)

        uiView.load(request)

        uiView.allowsBackForwardNavigationGestures = true
    }
}

struct loadSwiftProgrammingLanguage: View {
    @State var pageTitle: String = ""
    @State var filedir: String = ""
    @State var filename: String = ""
    
    // swift中文教程所有章节：数量
    let LangSwiftAllSectionsTotal = LangSwiftAllSectionsList.count
    
    // Swift中文教程 前一章节 后一章
    @State var preChapter: Int = 0
    @State var nextChapter: Int = 0
    
    var body: some View {
        VStack {
            loadLocalHtmlFileForSwift(filename: filename, filedir: filedir)
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                if preChapter >= 0 {
                    Button(action: {
                        getSwiftSectionInfo(preChapter)
                    }, label: {
                        Text("上一节")
                    })
                }
                Spacer()
                if nextChapter != LangSwiftAllSectionsTotal {
                    Button(action: {
                        getSwiftSectionInfo(nextChapter)
                    }, label: {
                        Text("下一节")
                    })
                }
            }
        }
        .task {
            getPageNumber()
        }
        .navigationTitle(pageTitle)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
    }
    
    // 显示上一章下一章
    func getPageNumber() {
        let fileIndex = LangSwiftAllNid.firstIndex(of: self.filename)
        if fileIndex != nil {
            if fileIndex! == 0 {
                self.preChapter = -1
            }
            if fileIndex! == 1 {
                self.preChapter = 0
            }
            if fileIndex! > 1 {
                self.preChapter = fileIndex! - 1
            }
            self.nextChapter = fileIndex! + 1
        }
    }
    
    func getSwiftSectionInfo(_ p: Int) {
        let info = LangSwiftAllSectionsList[p]
        self.filename = info.nid
        self.filedir = "swift/\(info.ndir)"
        self.pageTitle = info.name
        
        // 跳转后，还需要重新计算一次
        getPageNumber()
    }
}

struct loadSwiftProgrammingLanguage_Previews: PreviewProvider {
    static var previews: some View {
        loadSwiftProgrammingLanguage()
    }
}
