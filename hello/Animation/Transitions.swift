//
//  Transitions.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct Transitions: View {
    @State var show = false

    var body: some View {
        VStack {
            ZStack {
                if !show {
                    Text("View Transition")
                        .padding()
                        .background(Capsule().stroke())
                    
                    Text("备注：本页面主要用到了 .transition(.move(edge: .top))")
                        .font(.footnote)
                        .offset(y: 60)
                } else {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.blue)
                        .padding()
                        .transition(.move(edge: .top))
                        .zIndex(1)
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    show.toggle()
                }
            }
        }
        .navigationTitle(".transition")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Transitions_Previews: PreviewProvider {
    static var previews: some View {
        Transitions()
    }
}
