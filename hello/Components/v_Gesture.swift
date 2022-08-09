//
//  v_Gesture.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct v_Gesture: View {
    @State var isClick: Bool = false
    
    @GestureState var press = false
    @State var show = false
    
    @State var viewState = CGSize.zero
    
    var body: some View {
        VStack {
            Image(systemName: "heart.circle.fill")
                .frame(width: 80, height: 80)
                .foregroundColor(isClick ? .red : .black)
                .onTapGesture {
                    withAnimation {
                        self.isClick.toggle()
                    }
                }
            
            
            // 长按
            Image(systemName: "camera.fill")
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(show ? Color.black : Color.blue)
                .mask(Circle())
                .scaleEffect(press ? 2 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: show)
                .gesture(
                    LongPressGesture(minimumDuration: 0.5)
                        .updating($press) { currentState, gestureState, transaction in
                            gestureState = currentState
                        }
                        .onEnded { value in
                            show.toggle()
                        }
                )
            
            
            // 拖拽
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.blue)
                .frame(width: 80, height: 80)
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
        .navigationBarTitle("Gesture - 手势", displayMode: .inline)
    }
}

struct v_Gesture_Previews: PreviewProvider {
    static var previews: some View {
        v_Gesture()
    }
}
