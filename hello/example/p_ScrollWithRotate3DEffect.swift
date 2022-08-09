//
//  p_ScrollWithRotate3DEffect.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct p_ScrollWithRotate3DEffect: View {
    var body: some View {
        VStack {
            Text("Horizontal Scroll with rotate3DEffect")
                .font(.title)
                .offset(y: -100)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0 ..< 5) { item in
                        GeometryReader { geometry in
                            RoundedRectangle(cornerRadius: 30)
                                .fill(
                                    .blue
                                )
                                .rotation3DEffect(
                                    Angle(
                                        degrees: Double((geometry.frame(in: .global).minX - 20) / -20)
                                    ),
                                    axis: (x: 0, y: 1, z: 0),
                                    anchor: .center,
                                    anchorZ: 0.0,
                                    perspective: 1.0
                                )
                        }
                        .frame(width: 300, height: 300)
                    }
                }
                .padding()
            }
        }
    }
}

struct p_ScrollWithRotate3DEffect_Previews: PreviewProvider {
    static var previews: some View {
        p_ScrollWithRotate3DEffect()
    }
}
