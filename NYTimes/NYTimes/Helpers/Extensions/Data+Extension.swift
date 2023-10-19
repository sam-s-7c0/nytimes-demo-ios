//
//  Data+Extension.swift
//  NYTimes
//
//  Created by Samina Shaikh on 19/10/2023.
//

import Foundation

extension Data {
    
    public func getJSONFromData() -> [String: Any]? {
        do {
            if let json = try JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any] {
                return json
            }
        } catch _ as NSError {
            return nil
        }
        return nil
    }
}
