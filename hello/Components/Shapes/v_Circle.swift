//
//  v_Circle.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI

struct v_Circle: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Text("以下示例是对 Circle() 的应用。")
                    .foregroundColor(.gray)
                    .frame(height: 80, alignment: .center)
                
                // 示例1
                Circle()
                    .fill(.green.opacity(0.4))
                    .frame(width: 150, height: 150)
                    .overlay(
                        Text("Circle()").foregroundColor(.white)
                )
                
                // 示例2
                ZStack {
                   Circle().fill(Color.red)
                   Circle().fill(Color.green).scaleEffect(0.8)
                   Circle().fill(Color.yellow).scaleEffect(0.6)
                }
                .frame(width: 150)
                
                // 示例3
                Circle()
                    .fill(.yellow)
                    .overlay(
                        Circle().strokeBorder(.white).padding(15)
                    )
                    .frame(width: 150)
                
                // 示例4
                Circle()
                    .stroke(
                        Color.red,
                        style: StrokeStyle(
                            lineWidth: 5,
                            lineCap: .round,
                            lineJoin: .round,
                            miterLimit: .infinity,
                            dash: [20,0],
                            dashPhase: 0
                        )
                    )
                    .frame(width: 150)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Circle()")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Circle"))
    }
}

struct v_Circle_Previews: PreviewProvider {
    static var previews: some View {
        v_Circle()
    }
}
