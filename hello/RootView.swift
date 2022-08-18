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
    TabItem(name: "View", icon: "viewfinder", tab: .view),
    TabItem(name: "API", icon: "character", tab: .api),
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
}

struct RootView: View {
    
    let screenHeight = UIScreen.main.bounds.height
    
    @AppStorage("selectedTab") var selectedTab: Tab = .view
    
    @EnvironmentObject var quickActionSettings : QuickActionSettings
    @Environment(\.openURL) private var openURL
    
    @StateObject var pagePathManager = PathManager()

    var body: some View {
        
        if #available(iOS 16.0, *) {
            NavigationStack(path: $pagePathManager.path) {
                basic
                .navigationDestination(for: Target.self) { target in
                    switch target {
                    case .login:
                        UserLogin()
                    case .register:
                        UserLogin()
                    case .deviceInfo:
                        api_getSystemInfo()
                    }
                }
            }
            .onReceive(self.quickActionSettings.$quickAction) { new in
                let shortcutItem = quickActionSettings.quickAction
                if (shortcutItem == "ViewDeviceInfo") {
                    pagePathManager.path.append(Target.deviceInfo)
                }
                if (shortcutItem == "openGithub") {
                    openURL(URL(string: "https://github.com/yi-heng/hello-swift")!) { completed in
                        print("openGithub: -> \(completed)")
                    }
                }
            }
            .task {}
        } else {
            NavigationView {
                basic
            }
        }
    }
        
    var basic: some View {
        ZStack(alignment: .bottom) {
            Group {
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
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