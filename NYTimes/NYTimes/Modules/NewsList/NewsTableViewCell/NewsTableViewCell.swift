//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Samina Shaikh on 18/10/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var imageviewNews: UIImageView!
  @IBOutlet weak var labelTitle: UILabel!
  @IBOutlet weak var labelBy: UILabel!
  @IBOutlet weak var labelDate: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    imageviewNews.layer.masksToBounds = false
    imageviewNews.layer.cornerRadius = imageviewNews.frame.height/2
    imageviewNews.clipsToBounds = true
  }
  
  func setupCell(news: News) {
    self.labelTitle.text = news.title
    self.labelBy.text = news.byline
    self.labelDate.text = news.publishedDate
    
    // Check if there's media data
    if let media = news.media, media.count > 0 {
      let mediaObj = media[0]
      
      // Check if there's media metadata
      if let mediaMetadata = mediaObj.mediaMetadata, mediaMetadata.count > 0 {
        
        // Find the media metadata with the "Standard Thumbnail" format
        if let standardThumbnail = mediaMetadata.first(where: { $0.format == .standardThumbnail }) {
          
          // Get the URL from the found metadata
          if let url = standardThumbnail.url {
            self.imageviewNews.downloaded(from: url)
          }
        }
      }
    }
  }
}
