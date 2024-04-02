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
class HomeTableViewCell : UITableViewCell, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var popupMenu: UIButton!
    @IBOutlet weak var timeNews: UILabel!
    @IBOutlet weak var typeNews: UILabel!
    @IBOutlet weak var authorNews: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    
    var homeModel = HomeModel()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setUpView(item: ItemRss) {
        timeNews.text = item.pubDate
        typeNews.text = item.type
        authorNews.text = item.author
        titleNews.text = item.title
        imageNews.kf.setImage(with: URL(string: item.image),placeholder: UIImage(named: "placeholderImage"),
                              options: [
                                .processor(ResizingImageProcessor(referenceSize: CGSize(width: 140, height: 140))),
                                .scaleFactor(UIScreen.main.scale),
                                .transition(.fade(1)),
                                .cacheOriginalImage
                              ])
        popupMenu.addTarget(self, action: #selector(touchPopUp), for: .touchUpInside)
    }
    @objc func touchPopUp() {
        NotificationCenter.default.post(name: NSNotification.Name(Constant.POP_OVER_NOTIFICATION), object: nil, userInfo: [Constant.ANCHOR_POPOVER:self.popupMenu!])
        print()
        print("ĐÃ Gửi \(String(describing: popupMenu))")
    }
}
