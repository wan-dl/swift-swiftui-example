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
            
            Text("备注：本页面主要运用了.shadow")
                .font(.footnote)
                .offset(y: 20)
        }
        .navigationTitle(".shadow")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "shadow"))
    }
}

struct Shadow_Previews: PreviewProvider {
    static var previews: some View {
        Shadow()
    }
}
