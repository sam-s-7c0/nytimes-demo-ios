//
//  URLRequest.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
//

import Foundation

extension URLRequest {
  
  init?(url: String, method: HTTPMethod, body: [String: Any]?) {
    guard let requestURL = URL(string: url) else {
      return nil
    }
    
    self.init(url: requestURL)
    self.timeoutInterval = 30.0
    self.method = method
    
    setValue("application/json", forHTTPHeaderField: "Content-Type")
    setValue("application/json", forHTTPHeaderField: "Accept")
    
    if let body = body {
      do {
        httpBody = try JSONSerialization.data(withJSONObject: body)
      } catch {
        return nil
      }
    }
  }
}
