//
//  HomeController.swift
//  news_app
//
//  Created by hiepnv1 on 19/03/2024.
//

import UIKit
import Foundation
import FirebaseAuth
import FirebaseCore
class HomeViewController : BaseViewController {
    
    @IBOutlet weak var homeCollectionView : HomeCollectionView!
    @IBOutlet weak var homeTableView : HomeTableView!
    var popover : PopoverChangeSourceVC!
    
    @IBOutlet weak var iconNotification: UIButton!
    
    let homeModel = HomeModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.register(UINib(nibName: Constant.NEWS_TABLE_VIEW_CELL, bundle: .main), forCellReuseIdentifier: Constant.NEWS_TABLE_VIEW_CELL)
        homeCollectionView.register(UINib(nibName: Constant.CATEGORY_COLLECTION_VIEW_CELL, bundle: .main), forCellWithReuseIdentifier: Constant.CATEGORY_COLLECTION_VIEW_CELL)
        
        setUpHomeCollectionView()
        popover = PopoverChangeSourceVC(nibName: "PopoverViewController", bundle: nil) as PopoverChangeSourceVC
        handlerCallBack()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUpHomeCollectionView(typeSource : TypeClickPopover = .vnExpress) {
        if homeCollectionView.list.count != 0 {
            homeCollectionView.list.removeAll()
            homeCollectionView.reloadData()
        }
        homeModel.getCategoryByUser(typeClick: typeSource, callBack: { [weak self] (arrCategory) in
            self?.homeCollectionView.list = arrCategory
            self?.homeCollectionView.reloadData()
        })
    }
    
    func handlerCallBack() {
        homeCollectionView.callBack = {[weak self] category in
            if URL(string: category.url) != nil {
                self?.homeModel.fetchDataNews(category: category, callBack: { (arrNews) in
                    self?.homeTableView.setUpHomeTableView(arrNews: arrNews)
                })
            }
        }
        
        homeTableView.callBack = {[weak self] item in
            self?.openWebKitView(item: item)
        }
    }
    
    @objc private func back() {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    @IBAction func onTouchBtnNotification(_ sender: Any) {
        popover.setUp(anchor: iconNotification)
        popover.popoverPresentationController?.delegate = self
        present(popover, animated: true, completion: nil)
        popover.callBack = {[weak self]
            (type) in
            if type == .vnExpress || type == .tuoiTre {
                self?.setUpHomeCollectionView(typeSource: type)
            }
        }

    }

}


