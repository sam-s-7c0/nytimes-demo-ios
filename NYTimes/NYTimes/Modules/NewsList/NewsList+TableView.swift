//
//  NewsList+TableView.swift
//  NYTimes
//
//  Created by Samina Shaikh on 18/10/2023.
//

import UIKit

extension NewsListViewController : UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    presenter?.showNewsDetail(indexPath: indexPath)
  }
}

extension NewsListViewController : UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter?.newsResponse?.news?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {fatalError()}
    
    newsCell.accessibilityIdentifier = "myCell_\(indexPath.row)"
    
    guard let news = presenter?.newsResponse?.news? [indexPath.row] else {fatalError()}
    
    print(news)
    newsCell.setupCell(news: news)
    
    return newsCell
  }
}
