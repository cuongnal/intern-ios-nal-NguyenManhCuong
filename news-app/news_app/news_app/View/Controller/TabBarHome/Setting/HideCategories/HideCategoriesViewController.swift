//
//  HideCategoriesViewController.swift
//  news_app
//
//  Created by Manhcuong on 25/04/2024.
//

import Foundation
import UIKit

class HideCategoriesViewController : BaseViewController {
    
    @IBOutlet weak var hideCategoriesCV: HideCollectionView!
    @IBOutlet weak var segmentedControl: SourceSegmentedControl!
    private let settingModel = SettingModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        hideCategoriesCV.register(UINib(nibName: Constant.CATEGORY_COLLECTION_VIEW_CELL, bundle: .main), forCellWithReuseIdentifier: Constant.CATEGORY_COLLECTION_VIEW_CELL)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        setUpCollectionView()
        setButton()
    }
    func setUpCollectionView(typeSource : TypeSource = TypeSource.vnExpress) {
        settingModel.getCategory(typeSource: typeSource, callBackArrCategory: {[weak self] (arrCategory, arrIndex) in
            self?.hideCategoriesCV.data = arrCategory
            self?.hideCategoriesCV.typeSource = typeSource
            self?.hideCategoriesCV.listItemShow = arrIndex
            self?.hideCategoriesCV.reloadData()
        })
    }
    @IBAction func changeSource(_ sender: SourceSegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            setUpCollectionView(typeSource: .vnExpress)
        }
        else {
            setUpCollectionView(typeSource: .tuoiTre)
        }
    }
    func setButton() {
        let btnLeftFirst = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goBack))
        let btnLeftSecond = UIBarButtonItem(title: LanguageManager.getText(withKey: .settingCategories), style: .plain, target: nil, action: nil)
        
        btnLeftSecond.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ], for: .normal)
        navigationItem.leftBarButtonItems = [btnLeftFirst,btnLeftSecond]
        
        let btnSave = UIBarButtonItem(title: LanguageManager.getText(withKey: .save), style: .plain, target: self, action: #selector (saveCategoriesHidden))
        btnSave.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ], for: .normal)
        
        navigationItem.rightBarButtonItems = [btnSave]
    }
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func saveCategoriesHidden() {
        guard let typeSource = self.hideCategoriesCV.typeSource else {return}
        
        let listIndexShow = hideCategoriesCV.listItemShow
        
        let alert : UIAlertController = UIAlertController(title: LanguageManager.getText(withKey: .notification), message: LanguageManager.getText(withKey: .saveDisplayCategorySettings), preferredStyle: .alert)
        
        let action = UIAlertAction(title: LanguageManager.getText(withKey: .oke), style: .cancel, handler: {[weak self] _ in
            self?.dismiss(animated: false)
            self?.settingModel
                .updateListShowCategories(
                    withListIndex: listIndexShow,
                    typeSource: typeSource,
                    callBack: { [weak self] in
                        self?.showToast(text: LanguageManager.getText(withKey: .changedCategoryDisplay))
                    })
        })
        let action2 = UIAlertAction(title: LanguageManager.getText(withKey: .cancel), style: .default, handler: {[weak self] _ in
            self?.dismiss(animated: false)
        })
        alert.addAction(action)
        alert.addAction(action2)
        present(alert, animated: true)
    }
    
}
