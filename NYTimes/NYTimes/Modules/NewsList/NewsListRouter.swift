//  
//  NewsListRouter.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
/*
import UIKit

class NewsListRouter {
  // MARK: - Properties

  weak var presenter: NewsListPresenter?

  // MARK: - Methods

  static func createModule() -> NewsListViewController {
    let router = NewsListRouter()
    let presenter = NewsListPresenter()
    let interactor = NewsListInteractor()
    let view = NewsListViewController()

    presenter.interactor = interactor
    presenter.router = router
    presenter.view = view
    view.presenter = presenter
    interactor.presenter = presenter
    router.presenter = presenter

    return view
  }
}

// MARK: - NewsListRouterInterface

extension NewsListRouter: NewsListRouterInterface {}
*/

import UIKit

class NewsListRouter: NewsListWireframeProtocol {
    
    weak var viewController: UIViewController?
    weak var navigationController: UINavigationController?
    
    static func createModule(using navigationController: UINavigationController) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
      let view = NewsListViewController.init()
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
