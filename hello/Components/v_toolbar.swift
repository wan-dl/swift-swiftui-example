//
//  v_toolbar.swift
//  HelloSwift
//
//  Created by 1 on 9/20/22.
//

import SwiftUI

struct v_toolbar: View {
    
    var body: some View {
        List {
            Section(header: Text(".toolbar() 可以在工具栏或导航栏插入或填充特定项目。本页面演示所有的 .toolbar() 各种应用展示。").textCase(.none)) {}
            
            NavigationLink("底部工具栏 .bottomBar", destination: v_toolbar_bottomBar())
            
            Section("顶部导航栏") {
                NavigationLink("顶部导航栏 .navigation", destination: v_toolbar_navigation())
                NavigationLink("顶部导航栏 .navigationBarTrailing", destination: v_toolbar_navigationBarTrailing())
                NavigationLink("顶部导航栏 .navigationBarLeading", destination: v_toolbar_navigationBarLeading())
            }
            
            Section("键盘") {
                NavigationLink("键盘 .keyboard", destination: v_toolbar_keyboard())
            }
            
            Section() {
                NavigationLink(".automatic", destination: v_toolbar_automatic())
                NavigationLink(".principal", destination: v_toolbar_principal())
                NavigationLink(".status", destination: v_toolbar_status())
            }
            
            Section("") {
                NavigationLink(".primaryAction", destination: v_toolbar_primaryAction())
                NavigationLink(".cancellationAction", destination: v_toolbar_cancellationAction())
                NavigationLink(".destructiveAction", destination: v_toolbar_destructiveAction())
                NavigationLink(destination: v_toolbar_secondaryAction(), label: {
                    Text(".secondaryAction")
                    Text("iOS 16.0+")
                        .font(.footnote)
                        .foregroundColor(.gray)
                })
            }
        }
        .navigationTitle("toolbar")
    }
}

struct v_toolbar_Previews: PreviewProvider {
    static var previews: some View {
        v_toolbar()
    }
}
