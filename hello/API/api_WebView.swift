//
//  api_WebView.swift
//  HelloSwift
//
//  Created by 1 on 8/21/22.
//

import SwiftUI
import WebKit

fileprivate struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
        uiView.allowsBackForwardNavigationGestures = true
    }
}

struct api_WebView: View {
    @State var urlSite:String = "https://www.baidu.com"
    
    var body: some View {
        WebView(url: URL(string: self.urlSite)!)
            .edgesIgnoringSafeArea([.bottom])
            .navigationTitle("WebView")
            .navigationBarTitleDisplayMode(.inline)
            .modifier(navBarViewCodeAndDocs(pageType: "API",pageID: "WebView"))
    }
}

struct api_WebView_Previews: PreviewProvider {
    static var previews: some View {
        api_WebView()
    }
}
