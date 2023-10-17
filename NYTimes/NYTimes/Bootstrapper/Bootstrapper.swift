//
//  Bootstrapper.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
//

import Foundation
import UIKit

final class Bootstrapper {
  
  private var window : UIWindow
  private static var shared : Bootstrapper? = nil
  
  private init(window : UIWindow) {
    self.window = window
  }
  
  static func initialize() {
    if shared == nil {
      shared = Bootstrapper(window: makeNewWindow())
    }
    shared?.bootstrap()
  }
  
  private static func makeNewWindow() -> UIWindow {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.backgroundColor = UIColor.white
    return window
  }
  
  private func bootstrap() {
    showNewsList()
    window.makeKeyAndVisible()
  }
  
  private func showNewsList() {
    let navigationCotroller = UINavigationController()
    
    /* Create ui-view-controller instance*/
    let newsList = NewsListRouter.createModule(using: navigationCotroller)
    
    /*
     Initiating instance of ui-navigation-controller with view-controller
     */
    navigationCotroller.viewControllers = [newsList]
    
    /*
     setting up the root view-controller as ui-navigation-controller
     */
    window.rootViewController = navigationCotroller
  }
}
