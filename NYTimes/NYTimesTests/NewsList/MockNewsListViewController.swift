//
//  MockNewsListViewController.swift
//  NYTimesTests
//
//  Created by Samina Shaikh on 18/10/2023.
//

import XCTest
@testable import NYTimes

class MockNewsListViewController: NewsListViewProtocol {
  var presenter: NewsListPresenterProtocol?
  var expectationShowError: XCTestExpectation?
  var expectationShowLoader: XCTestExpectation?
  var expectationHideLoader: XCTestExpectation?
  var expectationRefreshTableview: XCTestExpectation?

  func showLoader() {
    expectationShowLoader?.fulfill()
  }
  
  func hideLoader() {
    expectationHideLoader?.fulfill()
  }
  
  func refreshView() {
    expectationRefreshTableview?.fulfill()
  }
  
  func showError(error: String) {
    expectationShowError?.fulfill()
  }
}
