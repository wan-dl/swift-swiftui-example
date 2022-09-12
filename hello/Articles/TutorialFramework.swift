//
//  TutorialFramework.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

struct TutorialFramework: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("App内，底部选项卡 “API”页面，演示了部分iOS系统API，如网络请求、选择相册照片、定位、分享等。")
            }
            .lineSpacing(6.0)
            .padding()
        }
        .navigationTitle("Framework")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialFramework_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFramework()
    }
}
