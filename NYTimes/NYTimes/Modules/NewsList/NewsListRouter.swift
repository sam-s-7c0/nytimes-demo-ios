//
//  NewsListRouter.swift
//  NYTimes
//
//  Created Samina Shaikh on 17/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

final class NewsListRouter {
  
  weak var viewController: UIViewController?
  var navigationController: UINavigationController?
  
  static func createModule(using navigationController: UINavigationController) -> UIViewController {
    
    let storyboard = UIStoryboard(name: "ListStoryboard", bundle: nil)
    guard let viewController = storyboard.instantiateViewController(withIdentifier: "NewsListViewController") as? NewsListViewController else {
      return UIViewController()
    }
    
    let view = viewController
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

extension NewsListRouter: NewsListWireframeProtocol {
  
  func showNewsDetail(newsUrl: String , title: String) {
    let controller = NewsDetailRouter.createModule(newsUrl: newsUrl, title: title)
    self.navigationController?.pushViewController(controller, animated: true)
  }
}
