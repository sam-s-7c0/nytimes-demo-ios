//
//  NewsListPresenterTests.swift
//  NYTimesTests
//
//  Created by Samina Shaikh on 18/10/2023.
//

import XCTest
@testable import NYTimes

class NewsListPresenterTests: XCTestCase {
  let interface = MockNewsListViewController()
  let interactor = MockNewsListInteractor()
  let router = MockNewsListRouter()
  var presenter : NewsListPresenter!
  
  override func setUp() {
    
    presenter = NewsListPresenter(interface: interface,
                                  interactor: interactor,
                                  router: router)
    interactor.presenter = presenter
    interface.presenter = presenter
  }
  
  override func tearDown() {
    super.tearDown()
    presenter = nil
  }
  
  func testNewsCount() {
    interactor.fileName = "news"
    presenter.viewDidLoad()
    
    if let newsCount = presenter.newsResponse?.news?.count {
      assert(newsCount > 0, "array count is nil")
    } else {
      XCTFail("newsResponse or news or count is nil")
    }
  }
  
  func testNewsObjects() {
    interactor.fileName = "news"
    presenter.viewDidLoad()
    
    if let newsObject = presenter.newsResponse?.news?[0]{
      XCTAssertNotNil(newsObject.title , "title is nil")
      XCTAssertNotNil(newsObject.byline , "byline is nil")
      XCTAssertNotNil(newsObject.publishedDate , "published Date is nil")
      XCTAssertNotNil(newsObject.url , "url is nil")
    } else {
      XCTFail("newsObject is nil")
    }
  }
  
  func testNewsObjectImage() {
    interactor.fileName = "news"
    presenter.viewDidLoad()
    
    let news = presenter.newsResponse?.news?.first
    let mediaMetadata = news?.media?.first?.mediaMetadata
    
    XCTAssertNotNil(news, "News object is nil")
    XCTAssertNotNil(mediaMetadata, "Media metadata is nil")
    
    if let standardThumbnail = mediaMetadata?.first(where: { $0.format == .standardThumbnail }) {
      XCTAssertNotNil(standardThumbnail.url, "URL is nil")
    } else {
      XCTFail("Standard Thumbnail metadata is missing")
    }
  }
  
  func testShowNewsDetail() {
    interactor.fileName = "news"
    presenter.viewDidLoad()
    
    let routerExpectation = expectation(description: "Router should be called")
    router.expectation = routerExpectation
    presenter.showNewsDetail(indexPath: IndexPath(row: 0, section: 0))
    waitForExpectations(timeout: 1)
  }
  
  func testFailedResponse() {
    interactor.fileName = "news_error"
    presenter.viewDidLoad()
  }
  
  func testAlertDisplay() {
    interactor.fileName = "news_error"
    
    let interfaceExpectation = expectation(description: "Alert will be displayed")
    interface.expectationShowError = interfaceExpectation
    presenter.viewDidLoad()
    waitForExpectations(timeout: 1)
  }
  
  func testJsonFormat() {
    interactor.fileName = "news_error_data_type"
    
    let interfaceExpectation = expectation(description: "Alert will be displayed")
    interface.expectationShowError = interfaceExpectation
    presenter.viewDidLoad()
    waitForExpectations(timeout: 1)
  }
  
  func testShowLoader() {
    interactor.fileName = "news"
    
    let interfaceExpectationShowLoader = expectation(description: "Loader is displayed")
    interface.expectationShowLoader = interfaceExpectationShowLoader
    presenter.viewDidLoad()
    waitForExpectations(timeout: 1)
  }
  
  func testHideLoader() {
    interactor.fileName = "news"
    
    let interfaceExpectationHideLoader = expectation(description: "Loader is hidden")
    interface.expectationHideLoader = interfaceExpectationHideLoader
    presenter.viewDidLoad()
    waitForExpectations(timeout: 1)
  }
  
  func testReloadTableview() {
    interactor.fileName = "news"
    
    let interfaceExpectationReloadTableView = expectation(description: "Tableview reloaded")
    interface.expectationRefreshTableview = interfaceExpectationReloadTableView
    presenter.viewDidLoad()
    waitForExpectations(timeout: 1)
  }
  
  func testSelectedOption() {
    
    interactor.fileName = "news"
    presenter.selectedOption(duration: "0")
    
    if let newsCount = presenter.newsResponse?.news?.count {
      assert(newsCount > 0, "array count is nil")
    } else {
      XCTFail("newsResponse or news or count is nil")
    }
  }
}
