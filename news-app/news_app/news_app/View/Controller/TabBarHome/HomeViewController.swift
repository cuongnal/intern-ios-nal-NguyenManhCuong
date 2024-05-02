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
    
    @IBOutlet weak var homeCollectionHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBarHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBarHome: SearchBarHome!
    let homeModel = HomeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.register(UINib(nibName: Constant.NEWS_TABLE_VIEW_CELL, bundle: .main), forCellReuseIdentifier: Constant.NEWS_TABLE_VIEW_CELL)
        homeCollectionView.register(UINib(nibName: Constant.CATEGORY_COLLECTION_VIEW_CELL, bundle: .main), forCellWithReuseIdentifier: Constant.CATEGORY_COLLECTION_VIEW_CELL)
        
        popoverChangeSource = PopoverChangeSourceVC(nibName: "PopoverChangeSource", bundle: nil) as PopoverChangeSourceVC
        popoverTableViewCell = PopoverTableViewCellVC(nibName: "PopoverViewController", bundle: nil) as PopoverTableViewCellVC
        handlerCallback()
        searchBarHome.placeholder = LanguageManager.getText(withKey: .search)
        
        setUpHomeCollectionView()
        
        NotificationCenter.default
            .addObserver(self,
                         selector:#selector(hiddenCategories),
                         name: NSNotification.Name ("HIDE"),object: nil)
    }
    @objc private func hiddenCategories (_ notification: Notification) {
        var typeSource = notification.userInfo?["typeSource"] as? TypeSource ?? TypeSource.vnExpress
        
        if homeCollectionView.data[0].typeSource != typeSource.rawValue {
            return
        }
        let typeClickPopover = typeSource == .vnExpress ? TypeClickPopover.vnExpress : TypeClickPopover.tuoiTre
        homeModel.getCategoryByUser(typeClick: typeClickPopover, callback: { [weak self] (arrCategory) in
            self?.homeCollectionView.data = arrCategory
            self?.homeCollectionView.reloadData()
        })
    }
    override func setUpLanguage() {
        searchBarHome.placeholder = LanguageManager.getText(withKey: .search)
        homeCollectionView.reloadData()
        homeTableView.reloadData()
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
        searchBarHome.text = nil
        searchBarHome.isTextSearching = false
    }
    
    func handlerCallback() {
        homeCollectionView.onTouchItemCallback = {[weak self] category in
            guard let self = self else {return}
            self.homeTableView.category = category
            guard URL(string: category.url) != nil else {return}
            
            if self.searchBarHome.isTextSearching == true{
                self.homeModel.fetchDataNewsAndSearch(category: category, searchText: self.searchBarHome.text ?? "", callback: { (arrNews) in
                    self.homeTableView.setUpHomeTableView(arrNews: arrNews)
                })
                
            } else {
                self.homeModel.fetchDataNews(category: category, callback: { (arrNews) in
                    self.homeTableView.setUpHomeTableView(arrNews: arrNews)
                })
            }
        }
        homeTableView.pullToRefresh() // gọi hàm này để đặt chức năng pull To refrshe
        homeTableView.pullToRefreshCallback = { [weak self] category in
            self?.homeModel.refreshDataNewsRemote(category: category, callback: { [weak self ](arrNews) in
                if self?.searchBarHome.isTextSearching == true {
                    self?.homeModel.searchNewsWithCategory(withArrayTextSearch: self?.searchBarHome.text ?? "", callBack: {[weak self] arrNewsSearch in
                        self?.homeTableView.data.removeAll()
                        self?.homeTableView.data.append(contentsOf: arrNewsSearch)
                        self?.homeTableView.reloadData()
                        self?.homeTableView.stopRefreshing()
                    })
                }
                else{
                    self?.homeTableView.data.removeAll()
                    self?.homeTableView.data.append(contentsOf: arrNews)
                    self?.homeTableView.reloadData()
                    self?.homeTableView.stopRefreshing()
                }
            })
        }
        
        homeTableView.onTouchNewsCallback = {[weak self] item in
            self?.openWebKitView(item: item)
        }
        
        homeTableView.openPopUpCallback = { [weak self] (itemNews, positionAnchor) in
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
            self.homeModel.searchNewsWithCategory(withArrayTextSearch: textSearch, callBack: { [weak self] arrNews in
                self?.homeTableView.data.removeAll()
                self?.homeTableView.data.append(contentsOf: arrNews)
                self?.homeTableView.reloadData()
            })
        }
        searchBarHome.onTouchCancelCallback = {}
    }
    func handleScrollTableView() {
        homeTableView.scrollDownCallback = {
            animationHideSearchBar(constant: 56)
        }
        homeTableView.scrollUpCallback = {[weak self] in
            guard let isText = self?.searchBarHome?.isTextSearching else {return}
            if !isText {
                animationHideSearchBar(constant: 0)
            }
        }
        
        func animationHideSearchBar(constant : CGFloat) {
            UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseInOut, animations: { [weak self] in
                self?.searchBarHeight.constant = constant
                self?.view.setNeedsLayout()
                self?.view.layoutIfNeeded()
            }, completion: nil)
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
        popoverChangeSource.onTouchTypeSourceCallback = {[weak self]
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
    private func saveBookmark(news : News) {
        homeModel.saveBookmark(withNews: news, callback: {})
    }
    private func shareNews(news : News) {
        presenShareSheet(withNews: news)
    }
    private func removeBookmark(news : News) {
        homeModel.deleteBookmarkNews(withNews: news)
    }
}

