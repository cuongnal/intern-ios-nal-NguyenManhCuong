//
//  HideCategoriesViewController.swift
//  news_app
//
//  Created by Manhcuong on 25/04/2024.
//

import Foundation
import UIKit

class HideCategoriesViewController : BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        setButton()
    }
    
    func setButton() {
        let btnLeftFirst = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goBack))
        let btnLeftSecond = UIBarButtonItem(title: LanguageManager.getText(withKey: .settingCategories), style: .plain, target: nil, action: nil)
        
        btnLeftSecond.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ], for: .normal)
        navigationItem.leftBarButtonItems = [btnLeftFirst,btnLeftSecond]
    }
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
