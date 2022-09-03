//
//  NavigationBar.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct NavigationBar: View {
    var title: String = "Title"
    
    @State var isGoSearch: Bool = false
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            NavigationLink {
                About()
            } label: {
                Text(title)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
            }
            
            NavigationLink {
                HomeSearch()
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .offset(x: -20)
        }
        .frame(height: 77)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Home")
    }
}
