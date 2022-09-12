//
//  v_DragGesture.swift
//  HelloSwift
//
//  Created by 1 on 9/12/22.
//

import SwiftUI

struct v_DragGesture: View {
    @State var viewState = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    viewState = .zero
                }
            }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.pink)
                .frame(width: 50, height: 50)
                .offset(x: viewState.width, y: viewState.height)
                .gesture(
                    drag
                )
            
            Text("将手指放到图标上，然后拖到其它地方试试。")
                .font(.body)
            
            Text("本示例主要演示 DragGesture() 的用法。")
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("拖曳 - DragGesture")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_DragGesture_Previews: PreviewProvider {
    static var previews: some View {
        v_DragGesture()
    }
}
