//
//  NewsDetailRouter.swift
//  NYTimes
//
//  Created Samina Shaikh on 18/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

final class NewsDetailRouter: NewsDetailWireframeProtocol {
  
  weak var viewController: UIViewController?
  
  static func createModule(newsUrl: String, title: String) -> UIViewController {
    
    let storyboard = UIStoryboard(name: "DetailStoryboard", bundle: nil)
    guard let viewController = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController else {
      return UIViewController()
    }
    
    let view = viewController
    let router = NewsDetailRouter()
    let presenter = NewsDetailPresenter(interface: view, router: router)
    
    view.presenter = presenter
    router.viewController = view
    presenter.newsUrl = newsUrl
    presenter.title = title

    return view
  }
}
