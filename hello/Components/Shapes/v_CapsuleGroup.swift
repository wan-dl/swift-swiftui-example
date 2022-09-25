//
//  v_CapsuleGroup.swift
//  HelloSwift
//
//  Created by 1 on 9/24/22.
//

import SwiftUI

struct v_CapsuleGroup: View {
    var body: some View {
        VStack(spacing: 100) {
            Text("Capsule()的组合使用")
                .foregroundColor(.gray)
            
            ZStack {
                NCapsule(color: .pink, degree: 0)
                NCapsule(color: .red, degree: 45)
                NCapsule(color: .yellow, degree: 90)
                NCapsule(color: .orange, degree: 135)
                NCapsule(color: .blue, degree: 180)
                NCapsule(color: .green, degree: 225)
                NCapsule(color: .purple, degree: 270)
                NCapsule(color: .accentColor, degree: 314)
            }
        }
        .navigationTitle("Capsule()")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "CapsuleGroup"))
    }
}

struct NCapsule: View {
    var color : Color
    var degree : Double
    
    var body: some View {
        Capsule()
            .foregroundColor(color)
            .frame(width : 60, height: 90)
            .offset(x: 0, y: 60)
            .rotationEffect(.degrees(degree))
            .opacity(0.75)
    }
}

struct v_CapsuleGroup_Previews: PreviewProvider {
    static var previews: some View {
        v_CapsuleGroup()
    }
}
