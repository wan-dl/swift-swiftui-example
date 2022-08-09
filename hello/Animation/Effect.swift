//
//  Effect.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct Effect: View {
    @State var show = false
    
    var body: some View {
        
        VStack {
            Text("Transform Animation")
                .font(.title)
                .offset(y: -80)
            
            exampleTa
        }
        .navigationBarTitle("Animation", displayMode: .inline)
    }
    
    var exampleTa: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 260, height: 200)
                .offset(y: 20)
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 300, height: 200)
                .onTapGesture {
                    withAnimation(.spring()) {
                        show.toggle()
                    }
                }
                .foregroundColor(.blue)
                .offset(y: show ? -200 : 0)
                .scaleEffect(show ? 1.2 : 1)
                .rotationEffect(.degrees(show ? 30 : 0))
                .rotation3DEffect(
                    Angle(degrees: show ? 30 : 0),
                    axis: (x: 1, y: 0, z: 0),
                    anchor: .center,
                    anchorZ: 0.0,
                    perspective: 1
                )
        }
    }
}

struct Effect_Previews: PreviewProvider {
    static var previews: some View {
        Effect()
    }
}
