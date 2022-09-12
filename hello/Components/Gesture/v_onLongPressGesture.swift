//
//  v_onLongPressGesture.swift
//  HelloSwift
//
//  Created by 1 on 9/12/22.
//

import SwiftUI

struct v_onLongPressGesture: View {
    @State var isLongPress: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            Image(systemName: "cloud.moon.rain.fill")
                .foregroundColor(.white)
                .font(.largeTitle)
                .background(isLongPress ? Color.pink : Color.blue)
                .mask(Circle())
                .onLongPressGesture(minimumDuration: 2) {
                    self.isLongPress.toggle()
                }
            
            Text("长按2S，改变 icon 背景色。")
                .font(.body)
            
            Text("本示例主要演示 .onLongPressGesture() 的用法。")
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("onLongPressGesture")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_onLongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        v_onLongPressGesture()
    }
}
