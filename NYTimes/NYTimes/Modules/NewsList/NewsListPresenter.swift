//  
//  NewsListPresenter.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.

import UIKit

final class NewsListPresenter {
  // MARK: - Properties
  
  weak var view: NewsListViewProtocol?
  var interactor: NewsListInteractorProtocol?
  var router: NewsListWireframeProtocol?
  
  init(interface: NewsListViewProtocol, interactor: NewsListInteractorProtocol?, router: NewsListWireframeProtocol) {
    self.view = interface
    self.interactor = interactor
    self.router = router
    
  }
}

// MARK: - NewsListPresenterInterface

extension NewsListPresenter: NewsListPresenterProtocol {}
