//
//  p_tabview.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct ColorName: Identifiable {
    let id = UUID()
    let name: Color
}

let ColorList: [ColorName] = [
    ColorName(name: .green.opacity(0.4)),
    ColorName(name: .yellow.opacity(0.4)),
    ColorName(name: .blue.opacity(0.4))
]

struct p_tabview: View {
    
    var body: some View {
        VStack {
            TabView {
                ForEach(ColorList) {item in
                    Rectangle()
                        .fill(item.name)
                        .cornerRadius(20)
                        .frame(maxWidth: .infinity)
                }
            }
            .tabViewStyle(.page)
            .padding()
            .frame(height: 300)
            .cornerRadius(20)
            
            Text("备注：轮播图示例，主要用了TabView")
        }
        .navigationTitle("轮播图示例")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct p_tabview_Previews: PreviewProvider {
    static var previews: some View {
        p_tabview()
    }
}
