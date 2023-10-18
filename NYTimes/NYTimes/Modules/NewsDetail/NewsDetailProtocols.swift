//
//  NewsDetailProtocols.swift
//  NYTimes
//
//  Created Samina Shaikh on 18/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

//MARK: Wireframe -
protocol NewsDetailWireframeProtocol: AnyObject {

}
//MARK: Presenter -
protocol NewsDetailPresenterProtocol: AnyObject {

  var newsUrl : String? { set get }
  var title : String? { set get }
  func viewDidLoad()
}

//MARK: View -
protocol NewsDetailViewProtocol: AnyObject {

  var presenter: NewsDetailPresenterProtocol?  { get set }
  func showLoader()
  func hideLoader()
  func setNavigationTitle(title: String)
  func setupNews(url: String)
}
