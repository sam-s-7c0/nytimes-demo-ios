//
//  News.swift
//  NYTimes
//
//  Created by Samina Shaikh on 17/10/2023.
//

import Foundation

// MARK: - Result
struct NewsResponse: Codable {
  let status, copyright: String?
  let numResults: Int?
  let news: [News]?
  
  enum CodingKeys: String, CodingKey {
    case status, copyright
    case numResults = "num_results"
    case news = "results"
  }
}

// MARK: - News
struct News: Codable {
  let url: String?
  let title,byline, publishedDate: String?
  let id: Int?
  let media: [Media]?
  
  enum CodingKeys: String, CodingKey {
    case url
    case byline, title
    case publishedDate = "published_date"
    case id
    case media
  }
}

// MARK: - Media
struct Media: Codable {
  
  let mediaMetadata: [MediaMetadata]?
  
  enum CodingKeys: String, CodingKey {
    case mediaMetadata = "media-metadata"
  }
}

// MARK: - MediaMetadatum
struct MediaMetadata: Codable {
  let format: Format?
  let url: String?
}

enum Format: String, Codable {
  case jumbo = "Jumbo"
  case large = "Large"
  case largeThumbnail = "Large Thumbnail"
  case mediumThreeByTwo210 = "mediumThreeByTwo210"
  case mediumThreeByTwo440 = "mediumThreeByTwo440"
  case normal = "Normal"
  case square320 = "square320"
  case square640 = "square640"
  case standardThumbnail = "Standard Thumbnail"
  case superJumbo = "superJumbo"
}
