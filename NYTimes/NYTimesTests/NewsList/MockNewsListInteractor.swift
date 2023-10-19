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
  
  func fetchNews(duration: Int) {
    
    let result = JSONManager.getNewsData()
    
    switch result {
    case .success(let data):
      do {
        let result = try JSONDecoder().decode(NewsResponse.self, from: data)
        self.presenter?.fetchNews(result: result)
      } catch let error {
        self.presenter?.showError(error: .decodingError(error))
      }
    case .failure(let error):
        print(error.localizedDescription)
    }
    

  }
}
