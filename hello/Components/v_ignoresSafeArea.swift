//
//  v_ignoresSafeArea.swift
//  HelloSwift
//
//  Created by 1 on 9/21/22.
// 关于安全区域

import SwiftUI

struct v_ignoresSafeArea: View {
    @State var isSwitch: Bool = false
    
    var body: some View {
        ZStack {
            Toggle(isOn: $isSwitch, label: {
                Text("是否使用 .ignoresSafeArea()")
            })
            .zIndex(100)
            .padding()
            
            if isSwitch {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            } else {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            }
        }
        .navigationTitle(".ignoresSafeArea()")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ignoresSafeArea"))
    }
}

struct v_ignoresSafeArea_Previews: PreviewProvider {
    static var previews: some View {
        v_ignoresSafeArea()
    }
}
