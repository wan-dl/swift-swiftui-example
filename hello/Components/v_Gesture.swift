//
//  v_Gesture.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct v_Gesture: View {
    var body: some View {
        VStack {
            List {
                Section("点击") {
                    NavigationLink("onTapGesture - 点击", destination: v_onTapGesture())
                    NavigationLink(destination: v_SpatialTapGesture(), label: {
                        Text("SpatialTapGesture")
                        Text("iOS 16.0+")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    })
                }
                
                Section("长按") {
                    NavigationLink("onLongPressGesture", destination: v_onLongPressGesture())
                    NavigationLink(".gesture( LongPressGesture() )", destination: v_gesture_LongPressGesture())
                }
                
                Section("") {
                    NavigationLink("DragGesture - 拖拽", destination: v_DragGesture())
                    NavigationLink("MagnificationGesture - 缩放", destination: v_MagnificationGesture())
                    NavigationLink("RotationGesture - 旋转", destination: v_RotationGesture())
                }
            }
        }
        .navigationTitle("Gesture - 手势")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_Gesture_Previews: PreviewProvider {
    static var previews: some View {
        v_Gesture()
    }
}
