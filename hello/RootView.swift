//
//  RootView.swift
//  HelloSwift
//
//  Created by 1 on 7/30/22.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var tab: Tab
}

var tabItems = [
    TabItem(name: "Home", icon: "house", tab: .home),
    TabItem(name: "SwiftUI", icon: "viewfinder", tab: .view),
    TabItem(name: "API", icon: "textformat", tab: .api),
    TabItem(name: "Example", icon: "pencil.and.outline", tab: .example)
]

enum Tab: String {
    case home
    case view
    case api
    case example
}

@available (iOS 16.0, *)
class PathManager: ObservableObject {
    @Published var path = NavigationPath()
}

enum Target: String {
    case login
    case register
    case deviceInfo
    case search
}

struct RootView: View {
    @EnvironmentObject var quickActionSettings : QuickActionSettings
    @Environment(\.openURL) private var openURL

    var body: some View {
        if #available(iOS 16.0, *) {
            RootViewForIOS16()
        } else {
            NavigationView {
                BasicView()
            }
        }
    }
}

@available(iOS 16.0, *)
struct RootViewForIOS16: View {
    @StateObject var pagePathManager = PathManager()
    @EnvironmentObject var quickActionSettings : QuickActionSettings
    
    var body: some View {
        NavigationStack(path: $pagePathManager.path) {
            BasicView()
            .navigationDestination(for: Target.self) { target in
                switch target {
                case .login:
                    UserLogin()
                case .register:
                    UserLogin()
                case .deviceInfo:
                    api_getSystemInfo()
                case .search:
                    HomeSearch()
                }
            }
        }
        .onReceive(self.quickActionSettings.$quickAction) { new in
            let shortcutItem = quickActionSettings.quickAction
            if (shortcutItem == "ViewDeviceInfo") {
                pagePathManager.path.append(Target.deviceInfo)
            }
            if (shortcutItem == "Search") {
                pagePathManager.path.append(Target.search)
            }
        }
        .task {}
    }
}

struct BasicView: View {
    let screenHeight = UIScreen.main.bounds.height
    
    @State var selectedTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            switch selectedTab {
            case .home:
                Home()
            case .view:
                ComponentsView()
            case .api:
                API()
            case .example:
                Examples()
            }
            
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        selectedTab = item.tab
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
                    .foregroundColor(selectedTab == item.tab ? .blue : .secondary)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, screenHeight > 667 ? 14 : 3)
            
            .frame(height: screenHeight > 667 ? 88 : 60, alignment: .top)
            .background(
                .ultraThinMaterial
//                ,in: RoundedRectangle(cornerRadius: 34, style: .continuous)
            )
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
