//
//  p_tabbar.swift
//  HelloSwift
//
//  Created by 1 on 7/30/22.
//

import SwiftUI

let exampleTabCode = """
struct eTabItem: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var tabname: eTab
}

var eTabItems = [
    eTabItem(name: "Home", icon: "house", tabname: .home),
    eTabItem(name: "Help", icon: "questionmark.circle", tabname: .help)
]

enum eTab: String {
    case home
    case help
}

struct p_tabbar: View {
    @State var selectedTab: eTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Group {
                switch selectedTab {
                case .home:
                    BasicView()
                case .help:
                    ExampleView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                ForEach(eTabItems) { item in
                    Button {
                        selectedTab = item.tabname
                    } label: {
                        VStack {
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.name)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(selectedTab == item.tabname ? .blue : .secondary)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 34, style: .continuous)
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            
        }
    }
}
"""

struct eTabItem: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var tabname: eTab
}

var eTabItems = [
    eTabItem(name: "Home", icon: "house", tabname: .home),
    eTabItem(name: "Help", icon: "questionmark.circle", tabname: .help)
]

enum eTab: String {
    case home
    case help
}

struct p_tabbar: View {
    @State var selectedTab: eTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            ScrollView {
                Text(exampleTabCode)
                    .textSelection(.enabled)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                ForEach(eTabItems) { item in
                    Button {
                        selectedTab = item.tabname
                    } label: {
                        VStack {
                            Image(systemName: item.icon)
                                .symbolVariant(.fill)
                                .font(.body.bold())
                                .frame(width: 44, height: 29)
                            Text(item.name)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(selectedTab == item.tabname ? .blue : .secondary)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 34, style: .continuous)
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .navigationBarTitle("自定义Tabbar", displayMode: .inline)
    }
}

struct p_tabbar_Previews: PreviewProvider {
    static var previews: some View {
        p_tabbar()
    }
}
