//
//  NavigationBar.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct NavigationBar: View {
    var title: String = "Title"
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            Text(title)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.leading, 20)
        }
        .frame(height: 77)
        .frame(maxHeight: .infinity, alignment: .topLeading)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Home")
    }
}
