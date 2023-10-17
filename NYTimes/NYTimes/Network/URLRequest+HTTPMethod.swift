//
//  URLRequest+HTTPMethod.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
//

import Foundation

extension URLRequest {
  enum HTTPMethod: String {
    case get = "GET"
  }
  
  var method: HTTPMethod? {
    get {
      guard let httpMethod = self.httpMethod else { return nil }
      return HTTPMethod(rawValue: httpMethod)
    }
    set {
      self.httpMethod = newValue?.rawValue
    }
  }
}
