//
//  v_Gradient.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

//VStack {
//    Rectangle()
//        .fill(.blue)
//        .frame(width: 200, height: 200)
////            .clipShape(Circle())
//        .mask(Circle())
////                .mask(Ellipse())
//
//    Circle()
//}
//.frame(width: 400, height: 400)
//.background(.ultraThinMaterial)

import SwiftUI

struct v_Gradient: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Section(header: Text("linearGradient - 从左到右").font(.caption)) {
                    FontGradient(start: .leading, end: .trailing)
                }
                
                Section(header: Text("linearGradient - 从右到左").font(.caption)) {
                    FontGradient(start: .trailing, end: .leading)
                }
                
                Section(header: Text("linearGradient - 从上到下").font(.caption)) {
                    FontGradient(start: .top, end: .bottom)
                }
                
                Section(header: Text("linearGradient - 从左到右").font(.caption)) {
                    Rectangle()
                        .fill(
                            .linearGradient(colors: [.blue, .green], startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(height: 50)
                }
                
                Section(header: Text("RadialGradient - 径向渐变").font(.caption).textCase(.none)) {
                    exampleGrdialGradient
                }
                
                Section(header: Text("AngularGradient - 角度渐变").font(.caption).textCase(.none)) {
                    HStack {
                        exampleAngularGradient
                        
                        exampleAngularGradientForStrokeBorder
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .navigationBarTitle("Gradient - 渐变", displayMode: .inline)
        }
    }
    
    
    var exampleGrdialGradient: some View {
        Circle()
            .fill(
                RadialGradient(
                        colors: [.red, .yellow, .green, .blue, .purple],
                        center: .center,
                        startRadius: 50,
                        endRadius: 100
                )
            )
            .frame(width: 150, height: 150)
    }
    
    var exampleAngularGradient: some View {
        Circle()
            .fill(
                AngularGradient(
                    colors: [.red, .yellow, .green, .blue, .purple, .red],
                    center: .center
                )
            )
            .frame(width: 150, height: 150)
    }
    
    var exampleAngularGradientForStrokeBorder: some View {
        Circle()
            .strokeBorder(
                    AngularGradient(
                        colors: [.red, .yellow, .green, .blue, .purple, .red],
                        center: .center,
                        startAngle: .zero,
                        endAngle: .degrees(360)
                    ),
                    lineWidth: 50
                )
            .frame(width: 150, height: 150)
    }
    
}

struct FontGradient: View {
    var start: UnitPoint
    var end: UnitPoint
    var body: some View {
        Text("Hello, Welcome!")
            .font(.title)
            .foregroundStyle(
                .linearGradient(
                    colors: [.blue, .green],
                    startPoint: start,
                    endPoint: end
                )
            )
    }
}

struct v_Gradient_Previews: PreviewProvider {
    static var previews: some View {
        v_Gradient()
    }
}
