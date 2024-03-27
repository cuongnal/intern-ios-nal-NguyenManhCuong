//
//  HomeTableViewCell.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import UIKit
import UIKit
import Kingfisher
import Foundation
import SwiftUI
class HomeTableViewCell : UITableViewCell {
    
    @IBOutlet weak var popupMenu: UIButton!
    @IBOutlet weak var timeNews: UILabel!
    @IBOutlet weak var typeNews: UILabel!
    @IBOutlet weak var authorNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setUpView(item: News) {
        timeNews.text = item.pubDate
        typeNews.text = item.type
        authorNews.text = item.author
        titleNews.text = item.title
        
        imageNews.kf.setImage(with: URL(string: item.image),placeholder: UIImage(named: "placeholderImage"),
                              options: [
                                .processor(ResizingImageProcessor(referenceSize: CGSize(width: 150, height: 150))),
                                .scaleFactor(UIScreen.main.scale),
                                .transition(.fade(1)),
                                .cacheOriginalImage
                              ])
    }
    
}
