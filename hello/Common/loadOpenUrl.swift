//
//  loadOpenUrl.swift
//  HelloSwift
//
//  Created by 1 on 9/8/22.
//

import SwiftUI
import WebKit

fileprivate struct loadRemoteURL: UIViewRepresentable {
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

// 在webview打开远程地址URL
struct loadOpenUrl: View {
    @State var url: String = ""
    @State var title: String = ""
    
    var body: some View {
        loadRemoteURL(url: URL(string: self.url)!)
            .edgesIgnoringSafeArea([.bottom])
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct loadOpenUrl_Previews: PreviewProvider {
    static var previews: some View {
        loadOpenUrl()
    }
}
