//
//  NewsListProtocols.swift
//  NYTimes
//
//  Created Samina Shaikh on 17/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

//MARK: Wireframe -
protocol NewsListWireframeProtocol: AnyObject {
  func showNewsDetail(newsUrl: String , title: String)
}

//MARK: Presenter -
protocol NewsListPresenterProtocol: AnyObject {
  var newsResponse: NewsResponse? { set get }
  var durationNews: Int { set get }
  func viewDidLoad()
  func startFetchingNews(duration : Int)
  func showNewsDetail(indexPath: IndexPath)
  func fetchNews(result: NewsResponse)
  func showError(error: NYNetworkError)
}

//MARK: Interactor -
protocol NewsListInteractorProtocol: AnyObject {
  var presenter: NewsListPresenterProtocol?  { get set }
  func fetchNews(duration: Int)
}

//MARK: View -
protocol NewsListViewProtocol: AnyObject {
  var presenter: NewsListPresenterProtocol?  { get set }
  func showLoader()
  func hideLoader()
  func refreshView()
  func showError(error: Error)
}
