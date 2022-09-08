//
//  openUrlInWebview.swift
//  HelloSwift
//
//  Created by 1 on 9/8/22.
//

import SwiftUI
import WebKit

struct ShowWebView: UIViewRepresentable {
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

struct InWebviewOpenUrl: View {
    @State var url: String = ""
    @State var title: String = ""
    
    var body: some View {
        WebView(url: URL(string: self.url)!)
            .edgesIgnoringSafeArea([.bottom])
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct InWebviewOpenUrl_Previews: PreviewProvider {
    static var previews: some View {
        InWebviewOpenUrl()
    }
}
