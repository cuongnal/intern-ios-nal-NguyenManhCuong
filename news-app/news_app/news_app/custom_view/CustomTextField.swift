//
//  CustomTextField.swift
//  news_app
//
//  Created by hiepnv1 on 08/03/2024.
//

import Foundation
import UIKit
class CustomTextField : UITextField {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        baselineOffsetFromBottom()
    }
    func baselineOffsetFromBottom () {
        let bottom = CALayer()
        bottom.frame = CGRect(x: 0, y: self.frame.height * 0.8, width: self.frame.width, height: 1)
        bottom.backgroundColor = UIColor.black.cgColor
        
        self.layer.addSublayer(bottom)
    }
    
}
