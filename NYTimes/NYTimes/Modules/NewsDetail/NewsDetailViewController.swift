//
//  NewsDetailViewController.swift
//  NYTimes
//
//  Created Samina Shaikh on 18/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import WebKit

final class NewsDetailViewController: BaseViewController {
  
  @IBOutlet private weak var webViewDetail: WKWebView!
  @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
  
  var newsDetail: DetailNews?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigation()
    if let newsDetail = newsDetail {
      loadNewsDetail(url: newsDetail.urlString)
    }
  }
}

extension NewsDetailViewController {
  
  private func setupView() {
    webViewDetail.uiDelegate = self
    webViewDetail.navigationDelegate = self
  }
  
  private func setupNavigation() {
    if let title = newsDetail?.navigationTitle {
      setUpNavigation(navTitle: title)
    }
    backButton()
  }
  
  private func showLoader() {
    DispatchQueue.main.async {
      self.activityIndicatorView.isHidden = false
      self.activityIndicatorView.startAnimating()
    }
  }
  
  private func hideLoader() {
    DispatchQueue.main.async {
      self.activityIndicatorView.isHidden = true
      self.activityIndicatorView.stopAnimating()
    }
  }
  
  private func loadNewsDetail(url: String) {
    showLoader()
    DispatchQueue.main.async {
      guard let url = URL(string: url) else {
        self.hideLoader()
        return
      }
      
      let request = URLRequest.init(url: url)
      self.webViewDetail.load(request)
    }
  }
}

extension NewsDetailViewController: WKUIDelegate {
  
}

extension NewsDetailViewController: WKNavigationDelegate {
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    let scrollableSize = CGSize(width: view.frame.size.width, height: webView.scrollView.contentSize.height)
    webViewDetail?.scrollView.contentSize = scrollableSize
    hideLoader()
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    hideLoader()
    AlertHelper.showAlert(from: self, message: error.localizedDescription)
  }
  
  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    hideLoader()
    AlertHelper.showAlert(from: self, message: error.localizedDescription)
  }
}
