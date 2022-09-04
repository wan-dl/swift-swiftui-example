//
//  Examples.swift
//  format
//
//  Created by hx on 7/26/22.
//

import SwiftUI

class Medicine: ObservableObject {
    @Published var name:String = "药材：三七"
}

struct Examples: View {
    var envMedicine = Medicine()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("导航栏和Tabber").textCase(.none)) {
                    NavigationLink("自定义导航栏样式", destination: p_navigationBar())
                    NavigationLink("自定义Tabbar", destination: p_tabbar())
                    NavigationLink("Loading", destination: p_loading())
                    NavigationLink("toolbar", destination: p_toolbar())
                }
                
                Section(header: Text("其它")) {
                    NavigationLink("轮播图示例", destination: p_tabview())
                    NavigationLink("滚动视图", destination: p_ScrollWithRotate3DEffect())
                    NavigationLink("Markdown AttributedString", destination: p_markdownWithAttributedString())
                    NavigationLink("控制视图点击区域", destination: p_contentShape())
                }
                
                Section(header: Text("数据")) {
                    NavigationLink("视图之间数据传递", destination: p_environment().environmentObject(envMedicine))
                }
                
                Section(header: Text("动画以及手势等")) {
                    NavigationLink("Tap Animation with Delay", destination: TapDelay())
                    NavigationLink("Shake - 设备摇动", destination: p_Shake())
                }
            }
            .listStyle(.insetGrouped)
        }
        .navigationTitle("示例")
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
}


struct Examples_Previews: PreviewProvider {
    static var previews: some View {
        Examples()
    }
}
