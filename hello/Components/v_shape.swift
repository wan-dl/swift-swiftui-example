//
//  v_shape.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct v_shape: View {
    var body: some View {
        ScrollView {
            HStack {
                Circle()
                    .fill(.green.opacity(0.4))
                    .frame(width: 150, height: 150)
                    .overlay(Text("圆形 Circle()").foregroundColor(.white))
                
                Rectangle()
                    .fill(.blue.opacity(0.4))
                    .mask(Ellipse())
                    .frame(width: 150, height: 150)
            }
            
            HStack(spacing: 30) {
                RoundedRectangle(cornerRadius: 0)
                    .fill(.red.opacity(0.4))
                    .frame(width: 150, height: 150)
                    .overlay(Text("正方形\n105x150").foregroundColor(.white))
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(.red.opacity(0.4))
                    .frame(width: 150, height: 150)
            }
            
            HStack(spacing: 30) {
                RoundedRectangle(cornerRadius: 30)
                    .inset(by: 10)
                    .stroke(Color.yellow, lineWidth: 15)
                    .frame(width: 150, height: 150)
                
                Circle()
                    .fill(.yellow)
                    .overlay(
                        Circle().strokeBorder(.white).padding(10)
                    )
                    .frame(width: 150, height: 150)
            }
            
            HStack(spacing: 30) {
                Ellipse()
                    .fill(.green)
                    .overlay(Text("椭圆 Ellipse()").foregroundColor(.white))
                    
            }
            .frame(height: 150)
            .padding()
            
            HStack(spacing: 30) {
                Capsule()
                    .fill(.pink)
                    .overlay(Text("胶囊 Capsule()").foregroundColor(.white))
            }
            .frame(height: 50)
            .padding()
        }
        .navigationBarTitle("形状")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "ShapeSet"))
    }
}

struct v_shape_Previews: PreviewProvider {
    static var previews: some View {
        v_shape()
    }
}
