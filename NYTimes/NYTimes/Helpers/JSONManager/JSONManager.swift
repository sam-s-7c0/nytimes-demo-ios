//
//  JSONManager.swift
//  NYTimes
//
//  Created by Samina Shaikh on 19/10/2023.
//

import Foundation

enum CustomError : LocalizedError {
    case error(message:String)
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}

struct JSONManager {
    
    static func getNewsData() -> Result<Data,Error> {
        return readData(from: "news")
    }
    
    private static func readData(from file:String) -> Result<Data,Error> {
        if let path = Bundle.main.path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return .success(data)
            } catch (let ex){
                return .failure(ex)
            }
        }else{
            return .failure(CustomError.error(message: "JSON file not found"))
        }
    }
}
