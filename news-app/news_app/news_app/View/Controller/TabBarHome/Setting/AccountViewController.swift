//
//  AccountViewController.swift
//  news_app
//
//  Created by hiepnv1 on 28/03/2024.
//

import Foundation
import UIKit
class AccountViewController : BaseViewController {
    
    @IBOutlet weak var accountTableView: SettingTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLanguage()
    }
    override func setUpLanguage() {
        setButton()
        accountTableView.register(UINib(nibName: "SettingTableViewCell", bundle: .main), forCellReuseIdentifier: Constant.SETTING_TABLE_VIEW_CELLS)
        accountTableView.data = SettingTableView.getAccountTableListItem()
        accountTableView.reloadData()
        onTouchCell()
    }
    func onTouchCell() {
        accountTableView.callback = {[weak self](typeItemClick) in
            if typeItemClick == .changePassword {
                self?.changePassword()
            }
        }
    }
    func changePassword() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ChangePassword") as? ChangePasswordViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func setButton() {
        let btnLeftFirst = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goBack))
        let btnLeftSecond = UIBarButtonItem(title: LanguageManager.getText(withKey: KeyText.ACCOUNT), style: .plain, target: nil, action: nil)
        
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
