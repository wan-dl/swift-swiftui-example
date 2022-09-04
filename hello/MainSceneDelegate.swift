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
        shortcutItemToProcess = shortcutItem
        //handleShortcutItem(shortcutItem)
    }
  
    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        shortcutItemToProcess = shortcutItem
        //handleShortcutItem(shortcutItem, completionHandler: completionHandler)
    }
  
    private func handleShortcutItem(
        _ shortcutItem: UIApplicationShortcutItem,
        completionHandler: ((Bool) -> Void)? = nil
    ) {
        print("App shortcutItem: -> \(shortcutItem)")
    }
}


class UYLNotificationDelegate: NSObject, UNUserNotificationCenterDelegate {

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.sound])
    }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
       didReceive response: UNNotificationResponse,
       withCompletionHandler completionHandler: @escaping () -> Void
  ) {
      switch response.actionIdentifier {
      case UNNotificationDismissActionIdentifier:
          print("Dismiss Action")
      case UNNotificationDefaultActionIdentifier:
          print("Default")
          if #available(iOS 16.0, *) {
              center.setBadgeCount(0)
          }
      case "Snooze":
          print("Snooze")
      case "Delete":
          print("Delete")
      default:
          print("Unknown action")
      }
      completionHandler()
    }
}
