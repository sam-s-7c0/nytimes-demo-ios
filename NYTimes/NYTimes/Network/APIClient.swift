//
//  APIClient.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
//

import Foundation

typealias URLResponse = Result<(data: Data, response: HTTPURLResponse), NYNetworkError>

final class APIClient {
  init() { }
  
  func dataTask(_ request: URLRequest, completionHandler: @escaping (URLResponse) -> Void) -> URLSessionDataTask {
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      if let response = response as? HTTPURLResponse {
        if let data = data {
          completionHandler(.success((data, response)))
        } else {
          completionHandler(.failure(.noData))
        }
      } else if error != nil {
        completionHandler(.failure(.connectionError))
      } else {
        completionHandler(.failure(.requestError))
      }
    }
    task.resume()
    return task
  }
}
