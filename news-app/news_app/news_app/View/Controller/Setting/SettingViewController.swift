//
//  SettingViewController.swift
//  news_app
//
//  Created by hiepnv1 on 28/03/2024.
//

import Foundation
import UIKit
class SettingViewController : UIViewController {
    
    @IBOutlet weak var settingTableView: SettingTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: .main), forCellReuseIdentifier: Constant.SETTING_TABLE_VIEW_CELLS)
        settingTableView.data = SettingTableView.SETTING_TABLE_LIST_ITEM
        settingTableView.reloadData()
        onTouchCell()
    }
    func onTouchCell() {
        settingTableView.callBack = { (typeItemClick) in
            if typeItemClick == .changePassword {
                switch(typeItemClick) {
                case .account :
                    self.openAccountViewController()
                case .languages:
                    self.changeLanguages()
                case .logOut:
                    self.logOut()
                default:
                    return
                }
            }
        }
    }
    func changeLanguages() {
        
    }
    func openAccountViewController() {
        
    }
    func logOut() {
        
    }
}
