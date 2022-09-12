//
//  v_onTapGesture.swift
//  HelloSwift
//
//  Created by 1 on 9/12/22.
//

import SwiftUI

struct v_onTapGesture: View {
    @State private var isTap: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            Image(systemName: "heart.circle.fill")
                .foregroundColor(isTap ? .red : .black)
                .font(.largeTitle)
                .onTapGesture {
                    withAnimation {
                        self.isTap.toggle()
                    }
                }
            
            Text("点击 icon, 可切换图标颜色")
                .font(.body)
            
            Text("本示例主要演示 .onTapGesture() 的用法。")
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("onTapGesture")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_onTapGesture_Previews: PreviewProvider {
    static var previews: some View {
        v_onTapGesture()
    }
}
