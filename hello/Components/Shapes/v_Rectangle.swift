//
//  v_Rectangle.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI

struct v_Rectangle: View {
    var body: some View {
        ScrollView {
            VStack(alignment:.center, spacing: 40) {
                
                Text("以下示例是对 Rectangle() 的应用。")
                    .foregroundColor(.gray)
                    .frame(height: 80, alignment: .center)
                
                // 示例1
                Section(header: Text("示例1：长方形 高度200")) {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(height: 200)
                        .overlay(
                            Text("长方形 高度200").foregroundColor(.white)
                        )
                }

                // 示例2
                Section(header: Text("示例2：正方形 150x150")) {
                    Rectangle()
                        .fill(.blue.opacity(0.5))
                        .frame(width: 150, height: 150)
                        .overlay(
                            Text("正方形 150x150").foregroundColor(.white)
                        )
                }

                // 示例3
                Section(header: Text("示例3：Rectangle()和渐变结合使用")) {
                    Rectangle()
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(width: 150, height: 150)
                }

                // 示例4
                Section(header: Text("示例4：Rectangle()和.mask(Ellipse())结合使用")) {
                    Rectangle()
                        .fill(.blue.opacity(0.5))
                        .mask(Ellipse())
                        .frame(width: 250, height: 150)
                        .overlay(
                            Text("椭圆\n结合.mask(Ellipse())").foregroundColor(.white).padding()
                        )
                }

                // 示例5
                Section(header: Text("示例5：旋转")) {
                    Rectangle()
                        .rotationEffect(Angle(degrees: -30))
                        .frame(width: 150, height: 150)
                }
                
                // 示例6
                Section(header: Text("示例6：翻转")) {
                    Rectangle()
                        .rotation3DEffect(Angle(degrees: 180), axis: (x: 20, y: 45, z:30))
                        .frame(width: 150, height: 150)
                }
            }
            
        }
        .navigationTitle("Rectangle()")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "Rectangle"))
    }
}

struct v_Rectangle_Previews: PreviewProvider {
    static var previews: some View {
        v_Rectangle()
    }
}
