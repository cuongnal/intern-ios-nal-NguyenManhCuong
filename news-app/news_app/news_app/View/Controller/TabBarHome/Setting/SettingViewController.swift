//
//  SettingViewController.swift
//  news_app
//
//  Created by hiepnv1 on 28/03/2024.
//

import UIKit
class SettingViewController : UIViewController {
    
    @IBOutlet weak var settingTableView: SettingTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        let btnLeftFirst = UIBarButtonItem()
 
        // navigationController?.navigationBar.topItem?.leftBarButtonItem = btnLeftFirst
        // navigationController?.navigationItem.leftBarButtonItem = btnLeftFirst
        // navigationItem.leftBarButtonItem = btnLeftFirst
        let label = UILabel()
        label.text = Constant.SETTING
        label.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        btnLeftFirst.customView = label
        navigationController?.navigationBar.topItem?.leftBarButtonItem = btnLeftFirst
        navigationController?.navigationBar.topItem?.title = Constant.SETTING
        navigationController?.navigationBar.topItem?.titleView = UIView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    @objc func nilAction() {}
    
    func setUpTableView() {
        settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: .main), forCellReuseIdentifier: Constant.SETTING_TABLE_VIEW_CELLS)
        settingTableView.data = SettingTableView.SETTING_TABLE_LIST_ITEM
        settingTableView.reloadData()
        onTouchCell()
    }
    
    func onTouchCell() {
        settingTableView.callBack = { [weak self] (typeItemClick) in
            switch(typeItemClick) {
            case .account :
                self?.openAccountViewController()
            case .languages:
                self?.changeLanguages()
            case .logOut:
                self?.logOut()
            default:
                return
            }
        }
        
    }
    func changeLanguages() {
        
    }
    func openAccountViewController() {
        guard let acc = self.storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as? AccountViewController else {
            return
        }
        navigationController?.pushViewController(acc, animated: true)
        
    }
    func logOut() {
        navigationController?.popToRootViewController(animated: true)
    }
}
