//
//  CategoryCollectionViewCell.swift
//  news_app
//
//  Created by user on 4/11/24.
//

import Foundation
import UIKit

class CategoryCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    func setUpUI(){
        self.layer.backgroundColor = Constant.COLOR_SIGN_UP_GRAY.cgColor
        self.label.textColor = Constant.COLOR_BLACK
        self.layer.cornerRadius = 15
    }
    func setBackGround(flag : Bool) {
        if flag {
            self.layer.backgroundColor = Constant.COLOR_BLACK.cgColor
            self.label.textColor = Constant.COLOR_WHITE
        }
        else {
            self.layer.backgroundColor = Constant.COLOR_SIGN_UP_GRAY.cgColor
            self.label.textColor = Constant.COLOR_BLACK
        }

    }
    
}
