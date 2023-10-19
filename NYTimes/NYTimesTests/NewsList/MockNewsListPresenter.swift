//
//  MockNewsListPresenter.swift
//  NYTimesTests
//
//  Created by Samina Shaikh on 18/10/2023.
//

import XCTest
@testable import NYTimes

class MockNewsListPresenter: XCTestCase {
  let interface = MockNewsListViewController()
  let interactor = MockNewsListInteractor()
  let router = MockNewsListRouter()
  var presenter : NewsListPresenter?
  var sampleResponse: NewsResponse!
  
  override func setUp() {
    
    presenter = NewsListPresenter.init(interface: interface,
                                       interactor: interactor,
                                       router: router)
    interactor.presenter = presenter
    interface.presenter = presenter
    
    if let path = Bundle.main.path(forResource: "news", ofType: "json"),
       let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
       let response = try? JSONDecoder().decode(NewsResponse.self, from: data) {
      self.sampleResponse = response

    }
    
    presenter?.newsResponse = sampleResponse

  }
  
  override func tearDown() {
    super.tearDown()
    self.presenter = nil
    self.sampleResponse = nil
    
    
  }
  
  func testViewDidLoad() {
    
    presenter?.viewDidLoad()
    presenter?.startFetchingNews(duration : 0)
    
  }
  
  func testShowNewsDetail() {
    
      
      let routerExpectation = expectation(description: "Router should be called")

      router.expectation = routerExpectation

     
      presenter?.showNewsDetail(indexPath: IndexPath(row: 0, section: 0))

      waitForExpectations(timeout: 10) { error in
          if let error = error {
              XCTFail("Expectation error: \(error)")
          }
      }
      XCTAssertTrue(router.showNewsDetailCalled)
  }

  
  
  
}

