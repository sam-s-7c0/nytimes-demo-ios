//
//  NYNetworkError.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
//

import Foundation

enum NYNetworkError: Error {
  case connectionError
  case urlInvalid
  case requestError
  case noData
  case responseError(HTTPURLResponse)
  case decodingError(Error)
}
