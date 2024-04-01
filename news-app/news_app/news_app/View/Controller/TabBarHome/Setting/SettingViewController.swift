//
//  SettingViewController.swift
//  news_app
//
//  Created by hiepnv1 on 28/03/2024.
//

import UIKit
class SettingViewController : UIViewController {
    
    @IBOutlet weak var viewPickLanguage: PickLanguageViewController!
    @IBOutlet weak var settingTableView: SettingTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        let btnLeftFirst = UIBarButtonItem()
        
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
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewPickLanguage.isHidden = true
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
                self?.viewPickLanguage.isHidden = true
                return
            }
        }
        
    }
    func changeLanguages() {
        UIView.transition(with: viewPickLanguage, duration: 0.4,
                          options: .transitionFlipFromBottom,
                          animations: {
            self.viewPickLanguage.isHidden = !self.viewPickLanguage.isHidden
                      })
       // viewPickLanguage.isHidden = !viewPickLanguage.isHidden
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
