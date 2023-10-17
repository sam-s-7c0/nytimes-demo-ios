//  
//  NewsListRouter.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.

import UIKit

final class NewsListRouter: NewsListWireframeProtocol {
  
  weak var viewController: UIViewController?
  weak var navigationController: UINavigationController?
  
  static func createModule(using navigationController: UINavigationController) -> UIViewController {
    // Change to get view from storyboard if not using progammatic UI
    let view = NewsListViewController()
    let interactor = NewsListInteractor()
    let router = NewsListRouter()
    let presenter = NewsListPresenter(interface: view, interactor: interactor, router: router)
    
    view.presenter = presenter
    interactor.presenter = presenter
    router.viewController = view
    router.navigationController = navigationController
    return view
  }
}
