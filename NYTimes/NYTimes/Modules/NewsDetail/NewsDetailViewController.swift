//
//  NewsDetailViewController.swift
//  NYTimes
//
//  Created Samina Shaikh on 18/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import WebKit

final class NewsDetailViewController: UIViewController {
  
  var presenter: NewsDetailPresenterProtocol?
  @IBOutlet private weak var webViewDetail: WKWebView!
  @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.viewDidLoad()
    setupView()
  }
}

extension NewsDetailViewController {
  
  private func setupView() {
    webViewDetail.uiDelegate = self
    webViewDetail.navigationDelegate = self
  }
}

extension NewsDetailViewController: NewsDetailViewProtocol {
  func showLoader() {
    DispatchQueue.main.async {
      self.activityIndicatorView.isHidden = false
      self.activityIndicatorView.startAnimating()
    }
  }
  
  func hideLoader() {
    DispatchQueue.main.async {
      self.activityIndicatorView.isHidden = true
      self.activityIndicatorView.stopAnimating()
    }
  }
  
  func setNavigationTitle(title: String) {
    self.title = title
  }
  
  func setupNews(url: String) {
    DispatchQueue.main.async {
      guard let url = URL(string: url) else {
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
    //self.presenter?.urlLoadingFailed(error: error)
  }
  
  func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
    hideLoader()
    
    //FIXME:
    //self.presenter?.urlLoadingFailed(error: error)
  }
}
