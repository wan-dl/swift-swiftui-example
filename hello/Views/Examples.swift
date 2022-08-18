//
//  Examples.swift
//  format
//
//  Created by hx on 7/26/22.
//

import SwiftUI

class Medicine: ObservableObject {
    @Published var name:String = "ginseng"
}

struct Examples: View {
    var envMedicine = Medicine()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("导航栏和Tabber")) {
                    NavigationLink("导航栏样式", destination: p_navigation())
                    NavigationLink("自定义Tabbar", destination: p_tabbar())
                    NavigationLink("Loading", destination: p_loading())
                    NavigationLink("toolbar", destination: p_toolbar())
                }
                
                Section(header: Text("其它")) {
                    NavigationLink("swipeActions应用", destination: p_swipeActions())
                    NavigationLink("轮播图示例", destination: p_tabview())
                    NavigationLink("滚动视图", destination: p_ScrollWithRotate3DEffect())
                    NavigationLink("Markdown AttributedString", destination: p_markdownWithAttributedString())
                }
                
                Section(header: Text("数据")) {
                    NavigationLink("视图之间数据传递", destination: p_environment().environmentObject(envMedicine))
                }
                
                Section(header: Text("动画")) {
                    NavigationLink("Tap Animation with Delay", destination: TapDelay())
                }
            }
            .listStyle(.insetGrouped)
            
        }
        .navigationBarTitle("示例", displayMode: .inline)
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
