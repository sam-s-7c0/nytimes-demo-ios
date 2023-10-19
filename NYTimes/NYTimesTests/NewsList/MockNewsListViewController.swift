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
  
  func showLoader() {
    
  }
  
  func hideLoader() {
    
  }
  
  func refreshView() {
    
  }
  
  func showError(error: Error) {
    
  }
  
}
