//
//  Shadow.swift
//  HelloSwift
//
//  Created by 1 on 8/2/22.
//

import SwiftUI

struct Shadow: View {
    var body: some View {
        VStack {
            Text("hello")
                .font(.title.bold())
                .foregroundColor(.white)
                .shadow(radius: 20)
        }
        .frame(width: 300,height: 400)
        .background(.pink)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.3), radius: 5, x:0, y: 2)
        .shadow(color: .pink.opacity(0.3), radius: 20, x:0, y:10)
    }
}

struct Shadow_Previews: PreviewProvider {
    static var previews: some View {
        Shadow()
    }
}
