//
//  BaseViewController.swift
//  NYTimes
//
//  Created by Samina Shaikh on 20/10/2023.
//

import UIKit

class BaseViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func setUpNavigation(navTitle: String) {
    title = navTitle
  }
  
  func rightButton() {
    let dropdownImage = UIImage(named: "closure_down")
    let dropdownButton = UIBarButtonItem(image: dropdownImage, style: .plain, target: self, action: #selector(dropdownTapped))
    self.navigationItem.rightBarButtonItem = dropdownButton
  }
  
  @objc func dropdownTapped() {}
  
  func backButton() {
    let backImage = UIImage(named: "closure_back")
    let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(backButtonTapped))
    navigationItem.leftBarButtonItem = backButton
  }
  
  @objc func backButtonTapped() {
    navigationController?.popViewController(animated: true)
  }
}
