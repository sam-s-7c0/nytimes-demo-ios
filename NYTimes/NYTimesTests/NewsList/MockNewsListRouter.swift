//
//  MockNewsListRouter.swift
//  NYTimesTests
//
//  Created by Samina Shaikh on 18/10/2023.
//

import XCTest
@testable import NYTimes

class MockNewsListRouter: NewsListWireframeProtocol {
  var expectation: XCTestExpectation?
  var showNewsDetailCalled = false
  
  func showNewsDetail(newsUrl: String, title: String) {
    showNewsDetailCalled = true
    expectation?.fulfill()

  }
  
}
