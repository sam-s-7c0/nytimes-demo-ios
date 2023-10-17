//  
//  NewsListInteractor.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
//

import Foundation

final class NewsListInteractor {
  // MARK: - Properties
  
  weak var presenter: NewsListPresenterProtocol?
}

// MARK: - NewsListInteractorInterface

extension NewsListInteractor: NewsListInteractorProtocol {}
