//
//  v_Colors.swift
//  HelloSwift
//
//  Created by 1 on 9/25/22.
//

import SwiftUI

struct colorItem: Identifiable {
    let id = UUID()
    var name: Color
    var desc: String
}

let semanticColors: [colorItem] = [
    colorItem(name: .accentColor, desc: "着重色 .accentColor"),
    colorItem(name: .secondary, desc: "次色 .secondary"),
    colorItem(name: .primary, desc: "主色 .primary"),
]

let standardColors: [colorItem] = [
    colorItem(name: .black, desc: "黑色 .black"),
    colorItem(name: .blue, desc: "蓝色 .blue"),
    colorItem(name: .brown, desc: "褐色 .brown"),
    colorItem(name: .clear, desc: "无色 .clear"),
    colorItem(name: .cyan, desc: "青色 .cyan"),
    colorItem(name: .gray, desc: "灰色 .gray"),
    colorItem(name: .green, desc: "绿色 .green"),
    colorItem(name: .indigo, desc: "靛蓝 .indigo"),
    colorItem(name: .mint, desc: "薄荷色 .mint"),
    colorItem(name: .orange, desc: "橙色 .orange"),
    colorItem(name: .pink, desc: "粉红色 .pink"),
    colorItem(name: .purple, desc: "紫色 .purple"),
    colorItem(name: .red, desc: "红色 .red"),
    colorItem(name: .teal, desc: "蓝绿色 .teal"),
    colorItem(name: .white, desc: "白色 .white"),
    colorItem(name: .yellow, desc: "黄色 .yellow"),
]

struct v_Colors: View {
    var body: some View {
        List {
            
//            Section("关于颜色设计方面，参考") {
//                NavigationLink("Apple human-interface-guidelines Color", destination: {
//                    loadOpenUrl(url: "https://developer.apple.com/design/human-interface-guidelines/foundations/color/")
//                })
//            }
            
            Section("语义颜色") {
                ForEach(semanticColors, id: \.id) {item in
                    HStack {
                        Rectangle()
                            .fill(item.name)
                            .frame(width: 30, height: 20)
                        
                        Text(item.desc).offset(x: 20)
                    }
                }
            }
            
            Section("标准色") {
                ForEach(standardColors, id: \.id) {item in
                    HStack {
                        Rectangle()
                            .fill(item.name)
                            .frame(width: 30, height: 20)
                        
                        Text(item.desc).offset(x: 20)
                    }
                }
            }
            
        }
        .navigationTitle("Color - 颜色")
    }
}

struct v_Colors_Previews: PreviewProvider {
    static var previews: some View {
        v_Colors()
    }
}
