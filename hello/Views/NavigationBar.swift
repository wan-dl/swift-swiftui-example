//
//  NavigationBar.swift
//  HelloSwift
//
//  Created by 1 on 7/31/22.
//

import SwiftUI

struct NavigationBar: View {
    var title: String = "Title"
    
    @State var isSearch: Bool = false
    @State var searchKeyword: String = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            
            Text(title)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(.leading, 20)
            
            Image(systemName: "magnifyingglass")
                .frame(maxWidth: .infinity, alignment: .topTrailing)
                .padding(.trailing, 20)
                .onTapGesture {
                    self.isSearch.toggle()
                }
                .fullScreenCover(isPresented: $isSearch) {
                    SearchView
                }
        }
        .frame(height: 77)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    var SearchView: some View {
        NavigationView {
            Text("")
                .searchable(text: $searchKeyword)
        }
        .onTapGesture {
            self.isSearch.toggle()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.2))
        .ignoresSafeArea(edges: .all)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Home")
    }
}
