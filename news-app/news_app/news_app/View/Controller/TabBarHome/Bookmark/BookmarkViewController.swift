//
//  BookmarkViewController.swift
//  news_app
//
//  Created by hiepnv1 on 26/03/2024.
//

import Foundation
import UIKit

class BookmarkViewController : BaseViewController {
    
    @IBOutlet weak var bookmarkCollectionView: BookmarkCollectionView!
    @IBOutlet weak var bookmarkTableView: BookmarkTableView!
    var popoverTableViewCell : PopoverTableViewCellVC!
    let bookmarkModel = BookmarkModel(newsRepository: NewsRepositoryImp(), categoryRepository: CategoryRepositoryImp() )
    override func viewDidLoad() {
        super.viewDidLoad()
        bookmarkTableView.register(UINib(nibName: Constant.NEWS_TABLE_VIEW_CELL, bundle: .main), forCellReuseIdentifier: Constant.NEWS_TABLE_VIEW_CELL)
        bookmarkCollectionView.register(UINib(nibName: Constant.CATEGORY_COLLECTION_VIEW_CELL, bundle: .main), forCellWithReuseIdentifier: Constant.CATEGORY_COLLECTION_VIEW_CELL)
        
        popoverTableViewCell = PopoverTableViewCellVC(nibName: "PopoverViewController", bundle: nil) as PopoverTableViewCellVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        setLeftTitle()
        setUpView()
    }
    func setUpView() {
        // lần đầu tiên khi mở thì phải gọi
        bookmarkModel.getCategoryAndNews(callBack: {[weak self](arrCategory) in
            self?.bookmarkCollectionView.data = arrCategory
            self?.bookmarkCollectionView.reloadData()
            guard arrCategory.count > 0 else {return}
            self?.bookmarkModel.getBookmarkOfCategory(withCategory: arrCategory[0], callBack: {[weak self] (arrNews)in
                guard let arrNews = arrNews else {return}
                self?.bookmarkTableView.data = arrNews
                self?.bookmarkTableView.reloadData()
            })
        })
        // xử lý callBack khi người dùng bấm nút
        bookmarkCollectionView.callBack = {[weak self] (item) in
            self?.bookmarkModel.getBookmarkOfCategory(withCategory: item, callBack: { [weak self] (arrNews) in
                guard let arrNews = arrNews else {return}
                self?.bookmarkTableView.data = arrNews
                self?.bookmarkTableView.reloadData()
            })
        }
        bookmarkTableView.onTouchNewsCallback = { [weak self] (itemNews) in
            self?.openWebKitView(item: itemNews)
        }
        
        bookmarkTableView.openPopUp = { [weak self] (itemNews, anchor) in
            self?.showPopover(withNews: itemNews, withAnchor: anchor)
        }
    }
    
    private func setLeftTitle() {
        let btnLeftFirst = UIBarButtonItem()
        let label = UILabel()
        label.text = Constant.BOOKMARKED
        label.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        btnLeftFirst.customView = label
        navigationController?.navigationBar.topItem?.leftBarButtonItem = btnLeftFirst
    }

}

extension BookmarkViewController {
    func showPopover(withNews news : News, withAnchor positionAnchor : UIView) {
        
        popoverTableViewCell.setUp(anchor: positionAnchor)
        popoverTableViewCell.popoverPresentationController?.delegate = self
        present(popoverTableViewCell, animated: true, completion: nil)
        
        popoverTableViewCell.callBack = {[weak self] (type) in
            if type == .bookmark {
                self?.unBookmark(news : news)
            }
            else {
                self?.shareNews(news: news)
            }
        }
    }
    func unBookmark(news : News) {
        bookmarkModel.unBookmarkNews(withNews: news, callBack: { [weak self] (arr) in
            if arr.count - 1  <= 0{
                self?.setUpView()
            }
            self?.bookmarkTableView.data.removeAll(where: {$0.idNews == news.idNews})
            self?.bookmarkTableView.reloadData()
        } )
    }
    func shareNews(news : News) {
        
    }
    
}
