//
//  ButtonLogin.swift
//  news_app
//
//  Created by hiepnv1 on 11/03/2024.
//

import UIKit
import Foundation

class ButtonLogin: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        customButton()
    }
    func customButton() {
        layer.cornerRadius = 20
        layer.backgroundColor = UIColor.gray.cgColor
    }
  

}

