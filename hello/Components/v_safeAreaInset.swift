//
//  v_safeAreaInset.swift
//  HelloSwift
//
//  Created by 1 on 9/22/22.
//

import SwiftUI

struct v_safeAreaInset: View {
    @State var setStatus: Bool = false
    
    var body: some View {
        ScrollView {
            ForEach(1..<100) { item in
                Text("number: \(item)")
                    .padding(.vertical)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding()
        }
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: setStatus ? 150 : 0)
         })
        .overlay(
            showList, alignment: .bottom
        )
        .navigationTitle(".safeAreaInset()")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI", pageID: "safeAreaInset"))
    }
    
    var showList: some View {
        VStack() {
            Text("滑动页面内容到底部时，会有部分内容被遮挡。使用 .safeAreaInset() 可以解决此问题。")
            Button(action: {
                self.setStatus.toggle()
            }, label: {
                Text(setStatus ? "清除safeAreaInset" : "设置safeAreaInset")
                  .foregroundColor(.white)
            })
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .backgroundColor(.cyan)
    }
}

struct v_safeAreaInset_Previews: PreviewProvider {
    static var previews: some View {
        v_safeAreaInset()
    }
}
