//
//  v_MagnificationGesture.swift
//  HelloSwift
//
//  Created by 1 on 9/12/22.
//

import SwiftUI

struct v_MagnificationGesture: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
        VStack(spacing: 30) {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.yellow)
                .frame(width: 120, height: 120, alignment: .center)
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
            
            Text("将双指放到图标上，然后向外分离。")
                .font(.body)
            
            Text("本示例主要演示 MagnificationGesture() 的用法。")
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("MagnificationGesture")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct v_MagnificationGesture_Previews: PreviewProvider {
    static var previews: some View {
        v_MagnificationGesture()
    }
}
