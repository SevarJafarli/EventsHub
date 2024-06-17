//
//  AppDelegate.swift
//  EventsHub
//
//  Created by Sevar Jafarli on 16.06.24.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow()
        self.window?.rootViewController = TabBarViewController()
        self.window?.makeKeyAndVisible()
        return true
    }
}
