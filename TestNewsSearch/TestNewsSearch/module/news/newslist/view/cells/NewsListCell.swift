//
//  NewsListCell.swift
//  NewsSearch
//
//  Created by 1 on 17.02.2019.
//  Copyright © 2019 1. All rights reserved.
//

import UIKit

class NewsListCell: UICollectionViewCell {
    
    static let cellId: String = "NewsListCell"
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupWithData(item: NewsItem) {
        self.newsImage.image = nil
        titleLabel.text = item.title
        detailLabel.text = item.description
        dateLabel.text = item.publishedAt?.formatToString("dd.MM.yyyy")
        guard let imageUrl = item.urlToImage else {
            return
        }
        ImageManager.sharedInstance.setImage(toImageView: self.newsImage, forKey: imageUrl)
        let favoriteImage = item.favorite ? "favorite" : "unfavorite"
        
        favoriteButton.setImage(UIImage(named: favoriteImage), for: .normal)
        
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
         self.newsImage.image = nil
    }
}
