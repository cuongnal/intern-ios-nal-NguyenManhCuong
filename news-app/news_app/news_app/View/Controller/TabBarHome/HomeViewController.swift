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
    
    
    @IBOutlet weak var titleOfNews: UILabel!
    @IBOutlet weak var homeCollectionView : HomeCollectionView!
    @IBOutlet weak var homeTableView : HomeTableView!
    var popoverChangeSource : PopoverChangeSourceVC!
    var popoverTableViewCell : PopoverTableViewCellVC!
    @IBOutlet weak var iconNotification: UIButton!
    
    @IBOutlet weak var searchBarHome: SearchBarHome!
    let homeModel = HomeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.register(UINib(nibName: Constant.NEWS_TABLE_VIEW_CELL, bundle: .main), forCellReuseIdentifier: Constant.NEWS_TABLE_VIEW_CELL)
        homeCollectionView.register(UINib(nibName: Constant.CATEGORY_COLLECTION_VIEW_CELL, bundle: .main), forCellWithReuseIdentifier: Constant.CATEGORY_COLLECTION_VIEW_CELL)
        
        setUpHomeCollectionView()
        popoverChangeSource = PopoverChangeSourceVC(nibName: "PopoverChangeSource", bundle: nil) as PopoverChangeSourceVC
        popoverTableViewCell = PopoverTableViewCellVC(nibName: "PopoverViewController", bundle: nil) as PopoverTableViewCellVC
        handlerCallback()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUpHomeCollectionView(typeSource : TypeClickPopover = .vnExpress) {
        if homeCollectionView.data.count != 0 {
            homeCollectionView.data.removeAll()
            homeCollectionView.reloadData()
        }
        titleOfNews.text = typeSource == .vnExpress ? Constant.VN_EXPRESS : Constant.TUOI_TRE
        homeModel.getCategoryByUser(typeClick: typeSource, callback: { [weak self] (arrCategory) in
            self?.homeCollectionView.data = arrCategory
            self?.homeCollectionView.reloadData()
        })
    }
    
    func handlerCallback() {
        homeCollectionView.onTouchItemCallback = {[weak self] category in
            self?.homeTableView.category = category
            if URL(string: category.url) != nil {
                self?.homeModel.fetchDataNews(category: category, callback: { (arrNews) in
                    self?.homeTableView.setUpHomeTableView(arrNews: arrNews)
                })
            }
        }
        
        homeTableView.pullToRefreshCallback = { [weak self] category in
            self?.homeModel.fetchDataNewsRemote(category: category, callback: { [weak self ](arrNews) in
                self?.homeTableView.data.removeAll()
                self?.homeTableView.data.append(contentsOf: arrNews)
                self?.homeTableView.stopRefreshing()
                self?.homeTableView.reloadData()
            })
        }
        homeTableView.pullToRefresher()
        
        homeTableView.onTouchNewsCallback = {[weak self] item in
            self?.openWebKitView(item: item)
        }
        
        homeTableView.openPopUp = { [weak self] (itemNews, positionAnchor) in
            self?.showPopover(withNews: itemNews, withAnchor: positionAnchor)
        }
        
        homeCollectionView.callbackDragDropItem = { [weak self] (arrCategory) in
            self?.homeModel.updateIndexCategoryOfUser(categories: arrCategory)
        }
        handleScrollTableView()
        handleSearchAction()
    }
    func handleSearchAction() {
        searchBarHome.onTextDidChangeCallback = { textSearch in
            self.homeModel.searchNewsWithCategory(withArrayText: textSearch, callBack: { [weak self] arrNews in
                self?.homeTableView.data.removeAll()
                self?.homeTableView.data.append(contentsOf: arrNews)
                self?.homeTableView.reloadData()
            })
        }
        searchBarHome.onTouchCancelCallback = {}
    }
    func handleScrollTableView() {
        let x = self.searchBarHome.heightAnchor.constraint(equalToConstant: 45)
        x.isActive = true
        
        homeTableView.scrollDownCallback = {
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveEaseInOut, animations: {
                x.constant = 45
                x.isActive = true
            }, completion: nil)
        }
        homeTableView.scrollUpCallback = {[weak self] in
            guard let isCheck = self?.searchBarHome?.textSearching.isEmpty else {
                return
            }
            if isCheck {
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                x.constant = 0
                x.isActive = true
            }, completion: nil)
        }
        }
    }
    
    @objc private func back() {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    @IBAction func onTouchBtnNotification(_ sender: Any) {
        popoverChangeSource.setUp(anchor: iconNotification)
        popoverChangeSource.popoverPresentationController?.delegate = self
        present(popoverChangeSource, animated: true, completion: nil)
        popoverChangeSource.callback = {[weak self]
            (type) in
            if type == .vnExpress || type == .tuoiTre {
                self?.setUpHomeCollectionView(typeSource: type)
            }
        }
    }
    
}
extension HomeViewController {
    func showPopover(withNews news : News, withAnchor positionAnchor : UIView) {
        
        popoverTableViewCell.setUp(anchor: positionAnchor)
        popoverTableViewCell.popoverPresentationController?.delegate = self
        
        homeModel.isBookmarkUser(withNews: news, callbackIsBookmark: { [weak self] (isBookmark) in
            guard let self = self, let popoverTableViewCell = self.popoverTableViewCell else{ return
            }
            
            popoverTableViewCell.type = isBookmark ? .popoverRemoveBookmark : .popoverBookmark
            
            self.present(popoverTableViewCell, animated: true, completion: nil)
            popoverTableViewCell.callback = {[weak self] (type) in
                switch (type){
                    case .bookmark :
                        self?.saveBookmark(news : news)
                    case .removeBookmark :
                        self?.removeBookmark(news: news)
                    case .share :
                        self?.shareNews(news: news)
                    default : break
                }
            }
        })
    }
    func saveBookmark(news : News) {
        homeModel.saveBookmark(withNews: news, callback: {})
    }
    func shareNews(news : News) {
        
    }
    func removeBookmark(news : News) {
        homeModel.deleteBookmarkNews(withNews: news)
    }
}

