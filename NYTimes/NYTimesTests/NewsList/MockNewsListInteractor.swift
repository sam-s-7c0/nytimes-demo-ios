//
//  MockNewsListInteractor.swift
//  NYTimesTests
//
//  Created by Samina Shaikh on 18/10/2023.
//

import XCTest
@testable import NYTimes

class MockNewsListInteractor: NewsListInteractorProtocol {
  
  var presenter: NewsListPresenterProtocol?
  var fileName = ""
  func fetchNews(duration: Int) {
    
    let result = JSONManager.getNewsData(jsonFile: fileName)
    
    switch result {
    case .success(let data):
      do {
        let result = try JSONDecoder().decode(NewsResponse.self, from: data)
        self.presenter?.fetchNews(result: result)
      } catch _ {
        self.presenter?.showError(error: .decodingError)
      }
    case .failure(let error):
      switch error {
      case .noData:
        self.presenter?.showError(error: .noData)
      case .urlInvalid:
        self.presenter?.showError(error: .urlInvalid)
      case .noInternet:
        self.presenter?.showError(error: .noInternet)
      case .connectionError:
        self.presenter?.showError(error: .connectionError)
      case .requestError:
        self.presenter?.showError(error: .requestError)
      case .decodingError:
        self.presenter?.showError(error: .decodingError)
      case .unknown:
        self.presenter?.showError(error: .unknown)
      }
    }
  }
}
