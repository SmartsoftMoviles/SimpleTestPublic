//
//  AppDelegate.swift
//  TestSonarCloud
//
//  Created by Diego Cruz on 29/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    /// # Variables
    var window: UIWindow?
    // MARK: Configuration App
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [
                        UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}
