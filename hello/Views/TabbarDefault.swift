//
//  Tabbar.swift
//  format
//
//  Created by hx on 7/26/22.
//

import SwiftUI



struct TabbarDefault: View {
    enum Tabbar {
        case view
        case example
        case my
    }
    
    @State private var activeTab: Tabbar = .view
    
//    init() {
//        UITabBar.appearance().backgroundColor = .green
//    }

    
    var body: some View {
        NavigationView {
            TabView(selection: $activeTab) {
                ComponentsView()
                    .tabItem({
                        Label("View", systemImage: "viewfinder")
                    })
                    .tag(Tabbar.view)
                
                Examples()
                    .tabItem({
                        Label("Example", systemImage: "ellipsis.curlybraces")
                    })
                    .tag(Tabbar.example)
            }
            .accentColor(.red)
            .tabViewStyle(.automatic)
        }
    }
}

struct TabbarDefault_Previews: PreviewProvider {
    static var previews: some View {
        TabbarDefault()
    }
}
