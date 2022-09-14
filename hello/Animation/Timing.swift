//
//  Timing.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct Timing: View {
    @State var show: Bool = false
    
    var body: some View {
        VStack {
            Text("Animation Modifier and Tinming")
                .font(.title)
                .offset(y: 120)
                .foregroundColor(.red)
            
            exampleTiming
        }
        .navigationBarTitle("Modifier and Tinming")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "AnimationTimingCurve"))
    }
    
    var exampleTiming: some View {
        ZStack {
            Color.black.ignoresSafeArea()
                .opacity(show ? 0.8 : 0.2)
                .animation(.easeOut(duration: 0.8), value: show)
            
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.white)
                .frame(height: 300)
                .opacity(show ? 1 : 0.5)
                .padding(show ? 16 : 32)
                .offset(y: show ? 0 : 30)
                .animation(.spring(response: 0.5, dampingFraction: 0.4), value: show)
            
            RoundedRectangle(cornerRadius: 40)
                .frame(height: 300)
                .offset(y: show ? 600 : 0)
                .foregroundColor(.white)
                .shadow(radius: 40)
                .padding()
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: show)
        }
        .onTapGesture {
            show.toggle()
        }
    }
}

struct Timing_Previews: PreviewProvider {
    static var previews: some View {
        Timing()
    }
}
