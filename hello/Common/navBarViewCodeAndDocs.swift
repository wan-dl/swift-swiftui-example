//
//  navBarViewCodeAndDocs.swift
//  HelloSwift
//
//  Created by 1 on 9/13/22.
//

import SwiftUI
import WebKit

struct navBarViewCodeAndDocs: ViewModifier {
    //@Environment(\.dismiss) private var dismiss
    
    @State var pageType: String = ""
    @State var pageID: String = ""
    
    @State var isPresentedForSource: Bool = false
    @State var isPresentedForDoc: Bool = false
    
    @State var sourceCode: String = ""
    
    @Environment (\.presentationMode) var presentationMode
    @State var disable = true
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Menu {
//                        Button(action: {
//                            isPresentedForDoc.toggle()
//                        }, label: {
//                            Label("查看文档", systemImage: "doc.viewfinder")
//                        })
                        
                        Button(action: {
                            isPresentedForSource.toggle()
                        }, label: {
                            Label("查看源码 ", systemImage: "text.viewfinder")
                        })
                    } label: {
                        Label("More", systemImage: "ellipsis.circle")
                            .labelStyle(.iconOnly)
                    }
                }
            }
            .sheet(isPresented: $isPresentedForSource) {
                VStack {
                    HStack() {
                        Text("当前页面源码")
                            .font(.title2)
                        Spacer()
                        
                        Button(action: {
                            //self.presentationMode.wrappedValue.dismiss()
                            self.isPresentedForSource = false
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.primary)
                                .font(.title2)
                        })
                        // swiftUI 3.0, 新增 interactiveDismissDisabled, 通过代码控制是否允许手势取消Sheet
                        //.interactiveDismissDisabled(disable)
                    }
                    .padding()
                    
                    showMarkDownText(filedir: pageType, filename: "\(pageID)_code")
                        
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .sheet(isPresented: $isPresentedForDoc) {
                VStack {
                    showMarkDownText(filedir: pageType, filename: "\(pageID)_doc")
                        .ignoresSafeArea()
                }
                .padding()
                .ignoresSafeArea(edges: .bottom)
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
        if fileURL == nil {
            return
        }
        
        uiView.loadFileURL(fileURL!, allowingReadAccessTo: fileURL!)

        let request = URLRequest(url: fileURL!)
        uiView.load(request)
        uiView.allowsBackForwardNavigationGestures = true
    }
}
