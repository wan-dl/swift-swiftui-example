//
//  Mask.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct Mask: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                ForEach(0 ..< 5) { item in
                    Text("Mask and Transparency")
                        .font(.title3).bold()
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                }
            }
            .frame(height: 300, alignment: .top)
            .padding()
            .background(Color.white)
            .mask(
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.black, Color.black, Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(30)
            .padding()
        }
        .navigationTitle(".mask")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Mask_Previews: PreviewProvider {
    static var previews: some View {
        Mask()
    }
}
