//
//  v_RotationGesture.swift
//  HelloSwift
//
//  Created by 1 on 9/12/22.
//

import SwiftUI

struct v_RotationGesture: View {
    @State private var currentAngle: Angle = .degrees(0)
    @State private var finalAngle: Angle = .degrees(0)
    
    var rotation: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.currentAngle = angle
            }
            .onEnded { angle in
                self.finalAngle += self.currentAngle
                self.currentAngle = .degrees(0)
            }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.green)
                .frame(width: 120, height: 120)
                .rotationEffect(currentAngle + finalAngle)
                .gesture(
                    rotation
                )
            
            Text("双指在图标上旋转试试")
                .font(.body)
            
            Text("本示例主要演示 RotationGesture() 的用法。")
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .navigationTitle("旋转 - RotationGesture")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "RotationGesture"))
    }
}

struct v_RotationGesture_Previews: PreviewProvider {
    static var previews: some View {
        v_RotationGesture()
    }
}
