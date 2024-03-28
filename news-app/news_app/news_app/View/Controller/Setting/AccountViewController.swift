//
//  AccountViewController.swift
//  news_app
//
//  Created by hiepnv1 on 28/03/2024.
//

import Foundation
import UIKit
class AccountViewController : UIViewController {
    @IBOutlet weak var settingTableView: SettingTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: .main), forCellReuseIdentifier: Constant.SETTING_TABLE_VIEW_CELLS)
        settingTableView.data = SettingTableView.ACCOUNT_TABLE_LIST_ITEM
        settingTableView.reloadData()
        
        self.navigationController?.navigationBar.isHidden = false
        onTouchCell()
    }
    func onTouchCell() {
        settingTableView.callBack = {(typeItemClick) in
            if typeItemClick == .changePassword {
                self.changePassword()
            }
        }
    }
    func changePassword() {
        
    }
}
