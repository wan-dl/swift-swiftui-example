//
//  v_SpatialTapGesture.swift
//  HelloSwift
//
//  Created by 1 on 9/12/22.
//

import SwiftUI


struct v_SpatialTapGesture: View {
    @State private var location: CGPoint = .zero
    
    
    @available(iOS 16.0, *)
    var tap: some Gesture {
        SpatialTapGesture()
            .onEnded { event in
                self.location = event.location
            }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            
            if #available(iOS 16.0, *) {
                Circle()
                    .fill(self.location.y > 50 ? Color.blue : Color.red)
                    .frame(width: 100, height: 100, alignment: .center)
                    .gesture(
                        tap
                    )
            }
            
            Text("根据点击位置切换颜色")
                .font(.body)
            
            Text("本示例主要演示 SpatialTapGesture() 的用法。\nSpatialTapGesture() 仅在iOS 16.0+系统生效")
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("SpatialTapGesture")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_SpatialTapGesture_Previews: PreviewProvider {
    static var previews: some View {
        v_SpatialTapGesture()
    }
}
