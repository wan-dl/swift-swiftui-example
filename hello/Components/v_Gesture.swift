//
//  v_Gesture.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct v_Gesture: View {
    @State var isTap: Bool = false
    @State var isLongPress: Bool = false
    
    // 用于长按
    @GestureState var press = false
    @State var isLongPressGesture:Bool = false

    @State var viewState = CGSize.zero
    
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    @State private var currentAngle: Angle = .degrees(0)
    @State private var finalAngle: Angle = .degrees(0)

    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 30) {
                // 点击
                onTapGestureView
                    .offset(y: 20)
                
                // 长按
                onLongPressGestureView
                LongPressGestureView
                
                // 拖拽
                DragGestureView
                
                // 放大缩小
                MagnificationGestureView
                
                // 旋转
                RotationGestureView
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Gesture - 手势")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var onTapGestureView: some View {
        Section("点击 - onTapGesture") {
            Image(systemName: "heart.circle.fill")
                .foregroundColor(isTap ? .red : .black)
                .frame(width: 60)
                .onTapGesture {
                    withAnimation {
                        self.isTap.toggle()
                    }
                }
        }
    }
    
    var onLongPressGestureView: some View {
        Section("长按2S，改变背景色 - onLongPressGesture") {
            Image(systemName: "cloud.moon.rain.fill")
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(isLongPress ? Color.pink : Color.blue)
                .mask(Circle())
                .onLongPressGesture(minimumDuration: 2) {
                    self.isLongPress.toggle()
                }
        }
    }
    
    var LongPressGestureView: some View {
        Section("长按手势：.gesture( LongPressGesture )") {
            Image(systemName: "camera.fill")
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(isLongPressGesture ? Color.pink : Color.blue)
                .mask(Circle())
                .scaleEffect(press ? 2 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isLongPressGesture)
                .gesture(
                    LongPressGesture(minimumDuration: 0.5)
                        .updating($press) { currentState, gestureState, transaction in
                            gestureState = currentState
                        }
                        .onEnded { value in
                            isLongPressGesture.toggle()
                        }
                )
        }
    }
    
    var DragGestureView: some View {
        Section("拖拽元素 - DragGesture") {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.pink)
                .frame(width: 50, height: 50)
                .offset(x: viewState.width, y: viewState.height)
                .gesture(
                    DragGesture().onChanged { value in
                        viewState = value.translation
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            viewState = .zero
                        }
                    }
                )
        }
    }
    
    var MagnificationGestureView : some View {
        Section("放大缩小 - MagnificationGesture") {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.yellow)
                .frame(width: 80, height: 80, alignment: .center)
                .scaleEffect(finalAmount + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { amount in
                            currentAmount = amount - 1
                        }
                        .onEnded { amount in
                            finalAmount += currentAmount
                            currentAmount = 0
                        }
                )
        }
    }
    
    // 旋转
    var RotationGestureView: some View {
        Section("旋转 - RotationGesture") {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.green)
                .frame(width: 80, height: 80)
                .rotationEffect(currentAngle + finalAngle)
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            self.currentAngle = angle
                        }
                        .onEnded { angle in
                            self.finalAngle += self.currentAngle
                            self.currentAngle = .degrees(0)
                        }
                )
        }
    }
}

struct v_Gesture_Previews: PreviewProvider {
    static var previews: some View {
        v_Gesture()
    }
}
