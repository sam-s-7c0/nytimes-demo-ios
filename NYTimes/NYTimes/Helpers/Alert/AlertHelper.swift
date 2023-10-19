//
//  AlertHelper.swift
//  NYTimes
//
//  Created by Samina Shaikh on 19/10/2023.
//

import UIKit

final class AlertHelper {
  static func showAlert(from viewController: UIViewController, title: String? = "Alert", message: String? = "Something went wrong", completion: (() -> Void)? = nil) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
      completion?()
    }
    alert.addAction(okAction)
    DispatchQueue.main.async {
      viewController.present(alert, animated: true, completion: nil)
    }
  }
  
  static func showOptions(from viewController: UIViewController, title: String?, options: [String], completion: @escaping (String?) -> Void) {
    
    let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
    
    for option in options {
      let optionAction = UIAlertAction(title: option, style: .default) { _ in
        completion(option)
      }
      alertController.addAction(optionAction)
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
      completion(nil)
    }
    alertController.addAction(cancelAction)
    
    if let popoverController = alertController.popoverPresentationController {
      popoverController.sourceView = viewController.view
      popoverController.sourceRect = CGRect(x: viewController.view.bounds.midX, y: viewController.view.bounds.midY, width: 0, height: 0)
      popoverController.permittedArrowDirections = []
    }
    viewController.present(alertController, animated: true, completion: nil)
  }
}
