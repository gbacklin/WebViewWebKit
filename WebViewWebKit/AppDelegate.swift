//
//  AppDelegate.swift
//  WebViewWebKit
//
//  Created by Gene Backlin on 10/15/19.
//  Copyright © 2019 Gene Backlin. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var pdfData: Data?
    var pdfURL: URL?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadPDFFile(name: "NikolaTesla")
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Utility
    
    func loadPDFFile(name: String) {
        if let pdFilefURL = Bundle.main.url(forResource: name, withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                pdfData = try Data(contentsOf: pdFilefURL)
                pdfURL = pdFilefURL
            } catch {
                debugPrint("PDF file not loaded...")
            }
        }

    }
}

