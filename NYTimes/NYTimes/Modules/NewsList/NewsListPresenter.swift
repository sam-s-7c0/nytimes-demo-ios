//
//  NewsListPresenter.swift
//  NYTimes
//
//  Created Samina Shaikh on 17/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

final class NewsListPresenter {
  
  weak private var view: NewsListViewProtocol?
  var interactor: NewsListInteractorProtocol?
  private let router: NewsListWireframeProtocol
  var newsResponse: NewsResponse?
  var durationNews: Int = 1
  var arrayDuration = ["1", "7", "30"]
  
  init(interface: NewsListViewProtocol, interactor: NewsListInteractorProtocol?, router: NewsListWireframeProtocol) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

extension NewsListPresenter: NewsListPresenterProtocol {
  
  func viewDidLoad() {
    startFetchingNews(duration: durationNews)
  }
  
  func startFetchingNews(duration : Int) {
    durationNews = duration
    view?.showLoader()
    interactor?.fetchNews(duration: duration)
  }
  
  func showNewsDetail(indexPath: IndexPath) {
    guard let news = newsResponse?.news? [indexPath.row],
          let newsUrl = news.url,
          let title = news.title
    else { return }
    
    router.showNewsDetail(newsUrl: newsUrl , title:title)
  }
  
  func fetchNews(result: NewsResponse) {
    newsResponse = result
    view?.hideLoader()
    view?.refreshView()
  }
  
  func showError(error: NYNetworkError) {
    self.view?.hideLoader()
    self.view?.showError(error: error.errorMessage())
  }
  
  func selectedOption(duration: String?) {
    if let selectedOption = duration, let duration = Int(selectedOption) {
      startFetchingNews(duration: duration)
    }
  }
}
