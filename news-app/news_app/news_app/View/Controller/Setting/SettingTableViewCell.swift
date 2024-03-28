//
//  SettingTableViewCell.swift
//  news_app
//
//  Created by hiepnv1 on 28/03/2024.
//

import Foundation
import UIKit
class SettingTableViewCell : UITableViewCell {
    @IBOutlet weak var label : UILabel!

    @IBOutlet weak var icon: UIImageView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setDataCell(item: (text: String, image: String, type: Any)) {
        label.text = item.text
        icon.image = UIImage(named: item.image)
    }
}
