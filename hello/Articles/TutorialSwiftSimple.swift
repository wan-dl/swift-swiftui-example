//
//  TutorialSwiftSimple.swift
//  Hello
//
//  Created by 1 on 10/15/22.
//

import SwiftUI

struct TutorialSwiftSimple: View {
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Text("由于网络上很多Swift中文教程，本页面不再显示，可以在App【极简开发】中查看。")
            
            Button(action: {
                gotoStore()
            }, label: {
                Label("下载App 极简开发", systemImage: "arrow.down.circle")
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        .pink,
                        in: RoundedRectangle(cornerRadius: 8)
                    )
            })
        }
        .padding()
    }
    
    func gotoStore() {
        let url = URL(string: "itms-apps://itunes.apple.com/cn/app/id1643821819")!
        
        if !UIApplication.shared.canOpenURL(url) {
             return
        }
        
        UIApplication.shared.open(url) { (success) in
            print("跳转状态: \(success)")
        }
    }
}

struct TutorialSwiftSimple_Previews: PreviewProvider {
    static var previews: some View {
        TutorialSwiftSimple()
    }
}
