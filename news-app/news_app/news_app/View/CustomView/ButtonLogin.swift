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
        
        setColorButton(flag : false)
    }
    func setColorButton(flag : Bool) {
        layer.cornerRadius = 20
        self.titleLabel?.textColor = Constant.COLOR_WHITE
        guard flag == true else {
            layer.backgroundColor = Constant.COLOR_SIGN_UP_GRAY.cgColor
            layer.borderColor = UIColor.black.cgColor
            return
        }
        layer.backgroundColor = UIColor.black.cgColor
        layer.borderColor = UIColor.black.cgColor
    }
    
    
    
}

