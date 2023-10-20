//
//  NYNetworkError.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
//

import Foundation

enum NYNetworkError: Error {
  case noData
  case connectionError
  case requestError
  case noInternet
  case urlInvalid
  case decodingError
  case unknown
  
  func errorMessage() -> String {
    switch self {
    case .noData:
      return "No data available."
    case .connectionError:
      return "Connection error."
    case .requestError:
      return "Request error."
    case .noInternet:
      return "No internet connection."
    case .urlInvalid:
      return "Invalid URL."
    case .decodingError:
      return "Data decoding error."
    case .unknown:
      return "An unknown error occurred."
    }
  }
}
