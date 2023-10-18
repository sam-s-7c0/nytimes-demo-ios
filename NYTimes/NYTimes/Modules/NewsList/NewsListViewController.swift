//
//  NewsListViewController.swift
//  NYTimes
//
//  Created Samina Shaikh on 17/10/2023.
//  Copyright © 2023 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

final class NewsListViewController: UIViewController {
  
  var presenter: NewsListPresenterProtocol?
  @IBOutlet private weak var tableviewNews: UITableView!
  @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter?.viewDidLoad()
    setupView()
    setupNavigation()
  }
}

extension NewsListViewController {
  private func setupView() {
    tableviewNews.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    tableviewNews.estimatedRowHeight = 130
    tableviewNews.rowHeight = UITableView.automaticDimension
  }
  
  private func setupNavigation() {
    self.title = "NY Times Most Popular Articles"
  }
}

extension NewsListViewController: NewsListViewProtocol {
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
  
  func refreshView() {
    DispatchQueue.main.async {
      self.tableviewNews.reloadData()
    }
  }
  
  func showError(error: Error) {
    
  }
}
