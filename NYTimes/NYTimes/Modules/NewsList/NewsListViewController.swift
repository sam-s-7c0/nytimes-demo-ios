//  
//  NewsListViewController.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.

import UIKit

final class NewsListViewController: UIViewController {
  // MARK: - Properties
  
  var presenter: NewsListPresenterProtocol?
  
}

// MARK: - NewsListViewInterface

extension NewsListViewController: NewsListViewProtocol {}
