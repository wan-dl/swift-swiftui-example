//
//  loadMarkDownInHtml.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI
import WebKit

struct loadLocalHtmlForMarkdown: UIViewRepresentable {
//    var filename: String
//    var filedir: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let fdir = "/Resouces.bundle/App"
        let fileURL = Bundle.main.url(forResource: "main.html", withExtension: nil, subdirectory: fdir)
        if fileURL == nil {
            return
        }
        uiView.loadFileURL(fileURL!, allowingReadAccessTo: fileURL!)
        
        var url = "\(fileURL!)#firstSight/introduce"
        print(url)
        let request = URLRequest(url: URL(string: url)!)

        uiView.load(request)

        uiView.allowsBackForwardNavigationGestures = true
    }
}

// 在html中加载markdown文件
struct loadMarkDownInHtml: View {
    @State var pageTitle: String = ""
    @State var filedir: String = ""
    @State var filename: String = ""
    
    var body: some View {
        VStack {
//            loadLocalHtmlForMarkdown(filename: filename, filedir: filedir)
            loadLocalHtmlForMarkdown()
        }
        .navigationTitle(pageTitle)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct loadMarkDownInHtml_Previews: PreviewProvider {
    static var previews: some View {
        loadMarkDownInHtml()
    }
}
