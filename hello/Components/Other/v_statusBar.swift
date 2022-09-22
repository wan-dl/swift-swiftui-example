//
//  v_statusBar.swift
//  HelloSwift
//
//  Created by 1 on 9/3/22.
//

import SwiftUI

struct v_statusBar: View {
    @State var hideStatusBar:Bool = false
    
    var body: some View {
        VStack {
            
            Text("简介：是否隐藏状态栏, 使用 .statusBarHidden(true)")
                .font(.caption)
                .foregroundColor(.gray)
                .frame(height: 80)
            
            Button("是否隐藏状态栏") {
                withAnimation {
                    self.hideStatusBar.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
            .statusBarHidden(hideStatusBar)

        }
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "statusBarHidden"))
    }
}

struct v_statusBar_Previews: PreviewProvider {
    static var previews: some View {
        v_statusBar()
    }
}
