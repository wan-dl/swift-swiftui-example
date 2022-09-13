//
//  navBarViewCodeAndDocs.swift
//  HelloSwift
//
//  Created by 1 on 9/13/22.
//

import SwiftUI
import WebKit

struct navBarViewCodeAndDocs: ViewModifier {
    @State var pageType: String = ""
    @State var pageID: String = ""
    
    @State var isPresentedForSource: Bool = false
    @State var isPresentedForDoc: Bool = false
    
    @State var sourceCode: String = ""
    
    func body(content: Content) -> some View {
        content
            .navigationBarItems(
                trailing:
                    Menu {
                        Button(action: {
                            isPresentedForDoc.toggle()
                        }, label: {
                            Label("查看文档", systemImage: "doc.viewfinder")
                        })
                        
                        Button(action: {
                            isPresentedForSource.toggle()
                        }, label: {
                            Label("查看当前页面源码 ", systemImage: "text.viewfinder")
                        })
                    } label: {
                        Label("More", systemImage: "ellipsis.circle")
                            .labelStyle(.iconOnly)
                    }
            )
            .sheet(isPresented: $isPresentedForSource) {
                VStack {
                    HStack() {
                        Text("源码")
                            .font(.title2)
                        Spacer()
                    }
                    .padding()
                    
                    showMarkDownText(filedir: pageType, filename: "\(pageID)_code")
                }
            }
            .sheet(isPresented: $isPresentedForDoc) {
                VStack {
                    showMarkDownText(filedir: pageType, filename: "\(pageID)_doc")
                }
                .padding()
            }
    }
}

struct showMarkDownText: UIViewRepresentable {
    var filedir: String
    var filename: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let subDir = filedir.isEmpty ? "/Resouces.bundle/App/" : "/Resouces.bundle/App/\(filedir)/"
        let fileURL = Bundle.main.url(forResource: filename, withExtension: ".html", subdirectory: subDir)
        print(fileURL)
        if fileURL == nil {
            return
        }
        
        uiView.loadFileURL(fileURL!, allowingReadAccessTo: fileURL!)

        let request = URLRequest(url: fileURL!)
        uiView.load(request)
        uiView.allowsBackForwardNavigationGestures = true
    }
}
