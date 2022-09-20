//
//  TutorialIntroduction.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

fileprivate let primer = """
Swift语言，让iOS开发门槛降低，只要您有点计算机基础，普通用户也将是开发者。

"""

fileprivate let ready = """
* 有一定的计算机基础。

* 有一台Mac电脑

* 有一台iPone或iPad设备

* 注册一个Apple ID

* 学习热情。保持热情更容易成功。
"""

struct TutorialIntroduction: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(primer)
                
                Text("在学习Swift之前，您需要准备")
                    .font(.headline)
                Divider()
                Text(ready)
            }
            .lineSpacing(6.0)
            .padding()
        }
        .navigationTitle("初见")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TutorialIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        TutorialIntroduction()
    }
}
