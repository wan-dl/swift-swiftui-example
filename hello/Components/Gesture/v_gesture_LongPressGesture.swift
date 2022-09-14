//
//  v_gesture_LongPressGesture.swift
//  HelloSwift
//
//  Created by 1 on 9/12/22.
//

import SwiftUI

struct v_gesture_LongPressGesture: View {
    @GestureState var press = false
    @State var isLongPressGesture:Bool = false
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 0.5)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { value in
                isLongPressGesture.toggle()
            }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            
            Image(systemName: "camera.fill")
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(isLongPressGesture ? Color.pink : Color.blue)
                .mask(Circle())
                .scaleEffect(press ? 2 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isLongPressGesture)
                .gesture(
                    longPress
                )
            
            Text("试试将手指按在图标上")
                .font(.body)
            
            Text("本示例主要演示 .gesture( LongPressGesture() ) 的用法。")
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("onLongPressGesture")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "onLongPressGesture2"))
    }
}

struct v_gesture_LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        v_gesture_LongPressGesture()
    }
}
