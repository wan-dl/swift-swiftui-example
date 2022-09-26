//
//  TapDelay.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct TapDelay: View {
    @State var tap = false

    var body: some View {
        VStack {
            Text("Tap Animation with Delay")
                .font(.title)
                .offset(y: -80)
            
            VStack {
                Text("View more").foregroundColor(.white)
            }
            .frame(width: 200, height: 200)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .mask(RoundedRectangle(cornerRadius: 30))
            .shadow(
                color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(tap ? 0.6 : 0.3),
                radius: tap ? 20 : 10,
                x: 0,
                y: tap ? 10 : 20
            )
            .scaleEffect(tap ? 1.2 : 1)
            .animation(.spring(response: 0.4, dampingFraction: 0.6), value: tap)
            .onTapGesture {
                tap = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    tap = false
                }
            }
        }
    }
}

struct TapDelay_Previews: PreviewProvider {
    static var previews: some View {
        TapDelay()
    }
}
