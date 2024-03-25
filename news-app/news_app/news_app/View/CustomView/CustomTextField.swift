//
//  CustomTextField.swift
//  news_app
//
//  Created by hiepnv1 on 08/03/2024.
//

import Foundation
import UIKit

class CustomTextField : UITextField {
    
    private var bottomSeparator: UIView = UIView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.textContentType = .oneTimeCode
        bottomSeparator.backgroundColor = .black
        setBaseLine()
    }
    
    private func setBaseLine() {
        addSubview(bottomSeparator)
        bottomSeparator.translatesAutoresizingMaskIntoConstraints = false
        bottomSeparator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomSeparator.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomSeparator.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        updateConstraintsIfNeeded()
    }

     func setTongleImage(_ button : UIButton)  {
        if(isSecureTextEntry) {
            button.setImage(UIImage(named: Constant.IC_PASSWORD_VISIBLE_OFF), for: .normal)
        }
        else {
            button.setImage(UIImage(named: Constant.IC_PASSWORD_VISIBLE), for: .normal)
        }
    }
    
    func enablePasswordToggle() -> () {
        let button = UIButton(type: .custom)
        setTongleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.frame = CGRect (x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: UIControl.Event.touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    @IBAction func togglePasswordView (_ sender : Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setTongleImage(sender as! UIButton)
    }
}

