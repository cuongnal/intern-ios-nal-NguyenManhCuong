//
//  SettingViewController.swift
//  news_app
//
//  Created by hiepnv1 on 28/03/2024.
//

import UIKit
import FirebaseAuth
class SettingViewController : BaseViewController{
    
    @IBOutlet weak var settingTableView: SettingTableView!
    let settingModel = SettingModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        settingModel.delegate = self
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpLabel()
        navigationController?.isNavigationBarHidden = false
    }
    override func setUpLanguage() {
        setUpLabel()
        setUpTableView()
    }
    func setUpLabel() {
        let btnLeftFirst = UIBarButtonItem()
        let label = UILabel()
        label.text = LanguageManager.getText(withKey: KeyText.setting)
        label.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        btnLeftFirst.customView = label
        navigationController?.navigationBar.topItem?.leftBarButtonItem = btnLeftFirst
        //        navigationController?.navigationBar.topItem?.title = Constant.SETTING
        //        navigationController?.navigationBar.topItem?.titleView = UIView()
    }
    @objc func nilAction() {}
    
    func setUpTableView() {
        settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: .main), forCellReuseIdentifier: Constant.SETTING_TABLE_VIEW_CELLS)
        settingTableView.data = SettingTableView.getSettingTableListItem()
        settingTableView.reloadData()
        onTouchCell()
    }
    
    func onTouchCell() {
        settingTableView.callback = { [weak self] (typeItemClick) in
            switch(typeItemClick) {
                case .account :
                    self?.openAccountViewController()
                case .languages:
                    self?.changeLanguages()
                case .logOut:
                    self?.logOut()
                case .categories :
                    self?.showAlertHideCategories()
                default:
                    return
            }
        }
        
    }
    func changeLanguages() {
        guard let p = storyboard?.instantiateViewController(withIdentifier: Constant.PICK_LANGUAGE_VIEW_CONTROLLER) as? PickLanguageViewController else { return  }
        p.modalPresentationStyle = .overFullScreen
        p.callBackChangeLanguage = { (language) in
            if language == .english {
                LanguageManager.changeLanguage(withTypeLanguage: .english)
            }
            else {
                LanguageManager.changeLanguage(withTypeLanguage: .vietnamese)
            }
        }
        present(p, animated: true)
    }
    private func openAccountViewController() {
        guard let acc = self.storyboard?.instantiateViewController(withIdentifier: "AccountViewController") as? AccountViewController else {
            return
        }
        navigationController?.pushViewController(acc, animated: true)
        
    }
    private func logOut() {
        settingModel.logOutEmail {
            UserDefaults.standard.removeObject(forKey: Constant.Key.USER_LOGIN)
            self.setRootViewControllerApp(withConstantNavKey: Constant.Key.NAV_AUTH)
        }
    }
    private func showAlertHideCategories() {
        let alert : UIAlertController = UIAlertController(title: LanguageManager.getText(withKey: .settingCategories), message: LanguageManager.getText(withKey: .questionHiddenCategories), preferredStyle: .alert)
        
        let actionShow = UIAlertAction(title: LanguageManager.getText(withKey: .show), style: .cancel, handler: {[weak self] _ in
            self?.setHiddenCategories(isHidden: false)
            self?.dismiss(animated: false)
        })
        let actionHide = UIAlertAction(title: LanguageManager.getText(withKey: .hide), style: .default, handler: {[weak self] _ in
            self?.setHiddenCategories(isHidden: true)
            self?.dismiss(animated: false)
        })
        alert.addAction(actionShow)
        alert.addAction(actionHide)
        present(alert, animated: true)
    }
    private func setHiddenCategories(isHidden : Bool) {
        settingModel.updateUser(isHiddenCategories: isHidden, callback: {
            NotificationCenter.default
                        .post(name: NSNotification.Name("HIDE"),
                         object: nil,
                         userInfo: nil)
        })
        
    }
}
