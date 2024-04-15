//
//  HomeTableViewCell.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import UIKit
import UIKit
import Foundation
import SwiftUI


class NewsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var popupMenu: UIButton!
    @IBOutlet weak var timeNews: UILabel!
    @IBOutlet weak var typeNews: UILabel!
    @IBOutlet weak var authorNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    
    var onTouchCallback : ((News, UIView) -> Void)?
    var news : News?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setUpView(item: News) {
        news = item
        timeNews.text = item.pubDate
        typeNews.text = item.typeCategory
        authorNews.text = item.author
        titleNews.text = item.title
        imageNews.image = UIImage(data: ImageCache.setImageWithURL(withURL: news!.image))

        popupMenu.addTarget(self, action: #selector(touchPopUp), for: .touchUpInside)
    }
    @objc func touchPopUp() {
        onTouchCallback?(news!, popupMenu)
    }
}
