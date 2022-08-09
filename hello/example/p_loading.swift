//
//  p_loading.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct p_loading: View {
    @State var appear = false
    
    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .frame(width: 44, height: 44)
            .rotationEffect(Angle(degrees: appear ? 360 : 0))
            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: appear)
            .onAppear {
                appear = true
            }
    }
}

struct p_loading_Previews: PreviewProvider {
    static var previews: some View {
        p_loading()
    }
}
