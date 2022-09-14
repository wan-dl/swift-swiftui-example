//
//  v_Tab.swift
//  format
//
//  Created by 1 on 7/28/22.
//

import SwiftUI

struct v_Tab: View {
    var body: some View {
        VStack {
            TabView {
                Text("The First Tab")
                    .badge(10)
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("First")
                    }
                Text("Another Tab")
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("Second")
                    }
                Text("The Last Tab")
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Third")
                    }
            }
        }
        .navigationBarTitle("TabView")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(navBarViewCodeAndDocs(pageType: "SwiftUI",pageID: "TabView"))
    }
}

struct v_Tab_Previews: PreviewProvider {
    static var previews: some View {
        v_Tab()
    }
}
