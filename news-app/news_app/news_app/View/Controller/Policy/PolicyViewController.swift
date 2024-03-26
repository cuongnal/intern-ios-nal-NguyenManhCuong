//
//  PolicyViewController.swift
//  news_app
//
//  Created by hiepnv1 on 26/03/2024.
//

import Foundation
import UIKit
class PolicyViewController : UIViewController {
    
    @IBOutlet weak var textPolicy: UITextView!
    @IBAction func tapBtnBack(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getPolicyApp()
    }
    func getPolicyApp(){
        let titleFormat : [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ]
        let bodyFormat : [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor : UIColor.black
        ]
        let strPolicyApp = NSMutableAttributedString()
        let title_1 = NSAttributedString(string: Constant.TITLE_POLICY_1, attributes: titleFormat)
        let title_2 = NSAttributedString(string: Constant.TITLE_POLICY_2, attributes: titleFormat)
        let bodyPolicy_1 = NSAttributedString(string: Constant.POLICY_1, attributes: bodyFormat)
        let bodyPolicy_2 = NSAttributedString(string: Constant.POLICY_2, attributes: bodyFormat)
        let bodyPolicy_3 = NSAttributedString(string: Constant.POLICY_3, attributes: bodyFormat)
        strPolicyApp.append(title_1)
        strPolicyApp.append(bodyPolicy_1)
        strPolicyApp.append(title_2)
        strPolicyApp.append(bodyPolicy_2)
        strPolicyApp.append(bodyPolicy_3)
        textPolicy.attributedText = strPolicyApp
    }
}
