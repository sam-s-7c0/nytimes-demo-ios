//
//  NetworkConstants.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
//

import Foundation

struct NetworkConstants {
  static let BASEURL = "https://api.nytimes.com/svc/"
  static let API_KEY: String = "k5BADU9mxnGi52oZFJbJWMVGSbrjrMf2"
  static let API_NEWS_LIST: String = "mostpopular/v2/mostviewed/all-sections/"
  
  static var newsListURL: URL {
    if let url = URL(string: BASEURL + API_NEWS_LIST) {
      return url
    } else {
      fatalError("Invalid URL: \(BASEURL + API_NEWS_LIST)")
    }
  }
}
