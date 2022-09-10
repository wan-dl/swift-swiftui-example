//
//  loadLocalHtml.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI
import WebKit

struct loadLocalHtmlFile: UIViewRepresentable {
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

struct loadLocalHtml: View {
    @State var pageTitle: String = ""
    @State var filedir: String = ""
    @State var filename: String = ""
    
    var body: some View {
        VStack {
            loadLocalHtmlFile(filename: filename, filedir: filedir)
        }
        .navigationTitle(pageTitle)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct loadLocalHtml_Previews: PreviewProvider {
    static var previews: some View {
        loadLocalHtml()
    }
}
