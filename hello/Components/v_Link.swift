//
//  ViewLink.swift
//  format
//
//  Created by hx on 7/28/22.
//

import SwiftUI

struct v_Link: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            Link("访问apple.com",
                 destination: URL(string: "https://www.apple.com")!)
            
            Link("Visit Our Site", destination: URL(string: "https://www.example.com")!)
                .environment(\.openURL, OpenURLAction { url in
                    print("您点击的URL是： \(url)")
                    return .handled
                })
        }
        .navigationBarTitle(Text("Link"), displayMode: .inline)
    }
}

struct v_Link_Previews: PreviewProvider {
    static var previews: some View {
        v_Link()
    }
}
