//
//  HomeScreenQuickActions.swift
//  HelloSwift
//
//  Created by 1 on 8/11/22.
//

import SwiftUI
import UIKit

final class MainSceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    @Environment(\.openURL) private var openURL: OpenURLAction
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionptions: UIScene.ConnectionOptions
    ) {
        guard let shortcutItem = connectionptions.shortcutItem else { return }
        handleShortcutItem(shortcutItem)
    }
  
    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        shortcutItemToProcess = shortcutItem
        handleShortcutItem(shortcutItem, completionHandler: completionHandler)
    }
  
    private func handleShortcutItem(
        _ shortcutItem: UIApplicationShortcutItem,
        completionHandler: ((Bool) -> Void)? = nil
    ) {
        print("App shortcutItem: -> \(shortcutItem)")
                
        if shortcutItem.type == "openGithub" {
            openURL(URL(string: "https://github.com/yi-heng/hello-swift")!) { completed in
                completionHandler!(completed)
            }
        }
        if shortcutItem.type == "ViewDeviceInfo" {
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = UIHostingController(rootView: api_getSystemInfo())
                window.makeKeyAndVisible()
            }
        }
        
    }
}
