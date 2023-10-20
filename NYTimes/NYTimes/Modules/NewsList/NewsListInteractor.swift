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
    guard ConnectivityChecker.isConnectedToInternet() else {
      presenter?.showError(error: .noInternet)
      return
    }
    
    if let previousTask = newsTask {
      previousTask.cancel()
    }
    
    do {
      let request = try buildRequest(for: duration)
      newsTask =  NewsListInteractor.apiClient.dataTask(request) { [weak self] result in
        switch result {
        case .success(let (data, _)):
          self?.processData(data)
        case .failure(let error):
          self?.handleError(error)
        }
      }
      newsTask.resume()
    } catch {
      presenter?.showError(error: .urlInvalid)
    }
  }
  
  private func buildRequest(for duration: Int) throws -> URLRequest {
    let urlString = "\(NetworkConstants.newsListURL)\(duration).json?api-key=\(NetworkConstants.API_KEY)"
    
    guard let request = URLRequest.init(url: urlString, method: .get, body: nil) else {
      throw NYNetworkError.urlInvalid
    }
    
    return request
  }
  
  private func processData(_ data: Data) {
    do {
      let result = try JSONDecoder().decode(NewsResponse.self, from: data)
      presenter?.fetchNews(result: result)
    } catch {
      presenter?.showError(error: .decodingError)
    }
  }
  
  private func handleError(_ error: NYNetworkError) {
    switch error {
    case .noData:
      presenter?.showError(error: .noData)
    case .noInternet:
      presenter?.showError(error: .noInternet)
    case .connectionError:
      presenter?.showError(error: .connectionError)
    case .requestError:
      presenter?.showError(error: .requestError)
    default:
      presenter?.showError(error: .unknown)
    }
  }
}
