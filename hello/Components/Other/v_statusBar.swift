//
//  v_statusBar.swift
//  HelloSwift
//
//  Created by 1 on 9/3/22.
//

import SwiftUI

struct v_statusBar: View {
    @State private var hideStatusBar = false
    
    var body: some View {
        VStack {
            
            Text("简介：切换状态栏, 使用 .statusBarHidden(true)")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            Button("切换状态栏") {
                withAnimation {
                    hideStatusBar.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            .statusBarHidden(true)

        }
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "statusBarSwitch"))
    }
}

struct v_statusBar_Previews: PreviewProvider {
    static var previews: some View {
        v_statusBar()
    }
}
