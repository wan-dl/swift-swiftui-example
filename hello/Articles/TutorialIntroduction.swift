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

fileprivate let appBackground = """
2022年8月初的时候，想做一款iOS 记账类的App。在此之前，未接触过iOS开发。

通过网络搜索，了解到Swift和SwiftUI。在短暂的调研后，投入时间开始学习，每天学习2~3小时，结果是惊喜的。

学习SwiftUI之时，随着时间推移，积累的代码，发现可以直接转换为一个Swift学习App。所以，便有了它：Swift达人
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
                
                Text("介绍")
                    .font(.headline)
                Divider()
                Text(appBackground)
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
