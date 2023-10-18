//
//  NewsDetailPresenter.swift
//  NYTimes
//
//  Created Samina Shaikh on 18/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

final class NewsDetailPresenter {
  
  weak private var view: NewsDetailViewProtocol?
  private let router: NewsDetailWireframeProtocol
  var newsUrl : String?
  var title : String?
  
  init(interface: NewsDetailViewProtocol, router: NewsDetailWireframeProtocol) {
    self.view = interface
    self.router = router
  }
}

extension NewsDetailPresenter: NewsDetailPresenterProtocol {
  
  func viewDidLoad() {
    guard let title = title,
        let url = newsUrl else {
            //ShowError
            return
    }
    view?.showLoader()
    view?.setNavigationTitle(title: title)
    view?.setupNews(url: url)
  }
}
