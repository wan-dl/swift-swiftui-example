//
//  a_withAnimation.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct a_withAnimation: View {
    @State var show: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("hello")
                    .font(.title.bold())
                    .foregroundColor(.white)
            }
            .frame(width: show ? 150: 200, height: show ? 50 : 80)
            .background(.blue)
            .cornerRadius(30)
            .shadow(color: .blue.opacity(0.3), radius: 20)
            .onTapGesture {
                withAnimation(.spring()) {
                    show.toggle()
                }
            }
            
            Text("备注：本页面主要展示withAnimation()的使用")
                .font(.footnote)
                .offset(y: 30)
        }
        .navigationTitle("withAnimation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct a_withAnimation_Previews: PreviewProvider {
    static var previews: some View {
        a_withAnimation()
    }
}
