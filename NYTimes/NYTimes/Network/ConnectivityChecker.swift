//
//  ConnectivityChecker.swift
//  NYTimes
//
//  Created by Samina Shaikh on 20/10/2023.
//

import SystemConfiguration

final class ConnectivityChecker {
  
  class func isConnectedToInternet() -> Bool {
    guard let reachability = SCNetworkReachabilityCreateWithName(nil, "https://www.nytimes.com/") else { return false }
    
    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(reachability, &flags) {
      return false
    }
    
    let isReachable = flags.contains(.reachable)
    let needsConnection = flags.contains(.connectionRequired)
    
    return (isReachable && !needsConnection)
  }
}
