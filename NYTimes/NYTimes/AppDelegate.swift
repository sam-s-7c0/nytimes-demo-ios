//
//  AppDelegate.swift
//  NYTimes
//
//  Created by Samina Shaikh on 16/10/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    Bootstrapper.initialize()
    return true
  }
}
