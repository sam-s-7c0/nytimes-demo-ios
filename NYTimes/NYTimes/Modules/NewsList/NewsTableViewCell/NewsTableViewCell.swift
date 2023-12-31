//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Samina Shaikh on 18/10/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
  
  @IBOutlet private weak var imageviewNews: UIImageView!
  @IBOutlet private weak var labelTitle: UILabel!
  @IBOutlet private weak var labelBy: UILabel!
  @IBOutlet private weak var labelDate: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    imageviewNews.layer.masksToBounds = false
    imageviewNews.layer.cornerRadius = imageviewNews.frame.height/2
    imageviewNews.clipsToBounds = true
  }
  
  func setupCell(news: News) {
    imageviewNews.image = nil
    self.labelTitle.text = news.title
    self.labelBy.text = news.byline
    self.labelDate.text = news.publishedDate
    
    if let media = news.media, media.count > 0 {
      let mediaObj = media[0]
      
      if let mediaMetadata = mediaObj.mediaMetadata, mediaMetadata.count > 0 {
        if let standardThumbnail = mediaMetadata.first(where: { $0.format == .standardThumbnail }) {
          if let url = standardThumbnail.url {
            self.imageviewNews.downloaded(from: url)
          }
        }
      }
    }
  }
}
