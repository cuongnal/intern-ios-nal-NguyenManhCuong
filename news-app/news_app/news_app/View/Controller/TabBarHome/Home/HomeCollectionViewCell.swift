//
//  HomeCollectionViewCell.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import Foundation
import UIKit

class HomeCollectionViewCell : UICollectionViewCell {
    
    
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
