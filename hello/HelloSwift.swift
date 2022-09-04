//
//  HelloSwiftApp.swift
//  format
//
//  Created by 1 on 7/22/22.
//

import SwiftUI

class QuickActionSettings: ObservableObject {
    @Published var quickAction:String? = nil
}

var shortcutItemToProcess: UIApplicationShortcutItem?
let notificationDelegate = UYLNotificationDelegate()

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        
        let configuration = UISceneConfiguration(
              name: "Main Scene",
              sessionRole: connectingSceneSession.role
        )
        
        // 本地通知
        let center = UNUserNotificationCenter.current()
        center.delegate = notificationDelegate
        
        configuration.delegateClass = MainSceneDelegate.self      
        return configuration
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print("log-DidReceiveMemoryWarning")
    }
}


@main
struct HelloSwiftApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // 主屏幕快捷操作菜单
    @Environment(\.scenePhase) var phase
    let quickActionSettings = QuickActionSettings()
    
    let NetMonitor = NetworkMonitor()
    
    init() {
        UserDefaults.standard.register(defaults: [
            "name": "你好"
        ])
    }
    
    var body: some Scene {
        
        WindowGroup {
            RootView()
                .environmentObject(quickActionSettings)
                .environmentObject(NetMonitor)
        }
        .onChange(of: phase) { (phaseValue) in
            switch phaseValue {
            case .active:
                guard let actionName = shortcutItemToProcess?.type as? String else { return }
                quickActionSettings.quickAction = actionName
                print("App: -> .active")
            case .background:
                print("App: -> .background")
            case .inactive:
                print("App: -> .inactive")
            @unknown default:
                print("App: -> Default")
            }
        }
        
    }
}
