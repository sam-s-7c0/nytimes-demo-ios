//
//  JSONManager.swift
//  NYTimes
//
//  Created by Samina Shaikh on 19/10/2023.
//

import Foundation
@testable import NYTimes

typealias dummyJsonResponse = Result<Data,NYNetworkError>

struct JSONManager {

  static func getNewsData(jsonFile: String) -> dummyJsonResponse {
        return readData(from: jsonFile)
    }
    
    private static func readData(from file:String) -> dummyJsonResponse {
      let frameworkBundle = Bundle(identifier: "sandbox-apps.NYTimesTests")
      if let path = frameworkBundle?.path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return .success(data)
            } catch {
              return .failure(.decodingError)
            }
        }else{
          return .failure(.noData)
        }
    }
}
