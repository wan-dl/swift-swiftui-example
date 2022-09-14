//
//  ViewLink.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct v_Link: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            Link("点击apple.com在浏览器打开",
                 destination: URL(string: "https://www.apple.com")!)
            
            Divider()
            
            Link("Visit Our Site", destination: URL(string: "https://www.example.com")!)
                .environment(\.openURL, OpenURLAction { url in
                    print("您点击的URL是： \(url)")
                    return .handled
                })
            
            Divider()
            
            if #available(iOS 16.0, *) {
                ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!) {
                    Label("ShareLink示例", image: "square.and.arrow.up")
                }
            }
        }
        .navigationBarTitle("Link")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Link"))
    }
}

struct v_Link_Previews: PreviewProvider {
    static var previews: some View {
        v_Link()
    }
}
