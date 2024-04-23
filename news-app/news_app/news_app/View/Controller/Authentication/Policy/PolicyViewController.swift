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
        let btnLeftFirst = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goBack))
        let btnLeftSecond = UIBarButtonItem(title: Constant.TEARMS_AND_CONDITIONS, style: .plain, target: nil, action: nil)

        btnLeftSecond.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ], for: .normal)

        btnLeftSecond.customView?.isUserInteractionEnabled = false
        navigationItem.leftBarButtonItems = [btnLeftFirst,btnLeftSecond]
        
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
      
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
        let title_1 = NSAttributedString(string: AppDefault.TITLE_POLICY_1, attributes: titleFormat)
        let title_2 = NSAttributedString(string: AppDefault.TITLE_POLICY_2, attributes: titleFormat)
        let bodyPolicy_1 = NSAttributedString(string: AppDefault.POLICY_1, attributes: bodyFormat)
        let bodyPolicy_2 = NSAttributedString(string: AppDefault.POLICY_2, attributes: bodyFormat)
        let bodyPolicy_3 = NSAttributedString(string: AppDefault.POLICY_3, attributes: bodyFormat)
        strPolicyApp.append(title_1)
        strPolicyApp.append(bodyPolicy_1)
        strPolicyApp.append(title_2)
        strPolicyApp.append(bodyPolicy_2)
        strPolicyApp.append(bodyPolicy_3)
        textPolicy.attributedText = strPolicyApp
    }
}
