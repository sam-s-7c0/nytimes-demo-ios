//
//  NewsListInteractor.swift
//  NYTimes
//
//  Created Samina Shaikh on 17/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.


import Foundation

final class NewsListInteractor {
  
  weak var presenter: NewsListPresenterProtocol?
  static let apiClient = APIClient()
  var newsTask: URLSessionDataTask!
  
}

extension NewsListInteractor: NewsListInteractorProtocol {
  
  func fetchNews(duration: Int) {
    
    let urlString = "\(NetworkConstants.newsListURL)\(duration).json?api-key=\(NetworkConstants.API_KEY)"
    
    guard let request = URLRequest.init(url: urlString, method: .get, body: nil ) else {
      presenter?.showError(error: .urlInvalid)
      return  }
    let task = NewsListInteractor.apiClient.dataTask(request) { [weak self] result in
      switch result {
      case .success(let (data, _)):
        do {
          let result = try JSONDecoder().decode(NewsResponse.self, from: data)
          self?.presenter?.fetchNews(result: result)
        } catch let error {
          self?.presenter?.showError(error: .decodingError(error))
        }
      case .failure(let error):
        
        switch error {
        case .noData:
          self?.presenter?.showError(error: .noData)
        case .urlInvalid:
          self?.presenter?.showError(error: .urlInvalid)
        case .connectionError:
          self?.presenter?.showError(error: .connectionError)
        case .requestError:
          self?.presenter?.showError(error: .requestError)
        case .responseError(let error):
          self?.presenter?.showError(error: .responseError(error))
        case .decodingError(let error):
          self?.presenter?.showError(error: .decodingError(error))
        }
      }
    }
    task.resume()
  }
}
