//
//  TutorialSwiftUI.swift
//  HelloSwift
//
//  Created by 1 on 9/10/22.
//

import SwiftUI

fileprivate let introText = """
SwiftUI 是Apple公司2019年在WWDC全球开发者大会上发布，是一种使用Swift语言在苹果设备上构建用户界面的创新且简单的方式。

该框架可以用于 watchOS、tvOS、macOS、iOS 等平台的应用开发。
"""

fileprivate let advantage = """
* SwiftUI使用声明式的Swift语法，代码易读并且写起来很自然。
* 代码量少，您只需使用一套工具和 API，就能在任何 Apple 设备上为所有人带来更加出色的体验。
* 同时它可以和Xcode中的设计工具配合使用，让设计工具中的展示样式和代码同步起来。
"""

fileprivate let systaxCode = """
import SwiftUI

struct test: View {
        var body: some View {
                Text("Hello，你好！")
        }
}
"""

fileprivate let codeDesc = """
如上所示代码，运行后会在屏幕中间显示如下效果：
"""

fileprivate let currentPageDesc = """
备注：App内，底部标签卡"SwiftUI"，对更多控件进行了演示。
"""

fileprivate let Precautions = """
SwiftUI开发的App，最低需要iOS 13才可以运行。

2022年9月，现在都iOS 16.0了，还需要考虑旧系统吗？
"""

struct TutorialSwiftUI: View {
    @State var exampleCode: AttributedString = ""
    @State var imageZoomd: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    Text("我们先来看一看SwiftUI的语法")
                    
                    Text(exampleCode)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 160)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .onAppear() {
                            setTextStyle()
                        }
                    
                    
                    Text(codeDesc)
                    
                    VStack {
                        Image("hello")
                            .resizable()
                            //.aspectRatio(contentMode: self.imageZoomd ? .fill : .fit)
                            .frame(width: 120, height: 240, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text(currentPageDesc)
                        .foregroundColor(Color.init(uiColor: UIColor(hexString: "#8053B5")))
                        .fontWeight(.medium)
                }
                
                Group {
                    Text("简介")
                        .font(.title2)
                    Divider()
                    Text(introText)
                        .lineSpacing(5.0)
                }
                
                Group {
                    Text("有哪些优点呢？")
                        .font(.title2)
                    Divider()
                    Text(advantage)
                        .lineSpacing(5.0)
                }
                
                Group {
                    Text("注意事项")
                        .font(.title2)
                    Divider()
                    Text(Precautions)
                        .lineSpacing(5.0)
                }
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.1))
        .navigationTitle("SwiftUI")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func setTextStyle() {
        var tmp = AttributedString(systaxCode)
        
        let keywords: [String] = ["struct", "import", "var", "some"]
        for i1 in keywords {
            if let range = tmp.range(of: i1) {
                tmp[range].foregroundColor = UIColor(hexString: "#9C2696")
                tmp[range].font = .body.bold()
            }
        }
        
        let keywords2: [String] = ["View", "Text", "@State", "TextField", "String"]
        for i2 in keywords2 {
            if let range = tmp.range(of: i2) {
                tmp[range].foregroundColor = UIColor(hexString: "#8053B5")
            }
        }
        
        let keywords3: [String] = ["$user", "user"]
        for i3 in keywords3 {
            if let range = tmp.range(of: i3) {
                tmp[range].foregroundColor = UIColor(hexString: "#126BA2")
            }
        }
        self.exampleCode = tmp
    }
}

struct TutorialSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        TutorialSwiftUI()
    }
}
