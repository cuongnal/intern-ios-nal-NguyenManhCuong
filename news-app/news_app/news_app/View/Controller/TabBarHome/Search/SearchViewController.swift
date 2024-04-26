//
//  SearchViewController.swift
//  news_app
//
//  Created by user on 4/11/24.
//

import Foundation
import UIKit

class SearchViewController : BaseViewController {
    private let searchModel = SearchModel(newsRepository: NewsRepositoryImp() )
    private let btnLeftFirst = UIBarButtonItem()
    @IBOutlet weak var searchTableView: SearchTableView!
    
    @IBOutlet weak var searchBar: SearchBarHome!
    
    @IBOutlet weak var searchBarHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.register(UINib(nibName: Constant.NEWS_TABLE_VIEW_CELL, bundle: .main), forCellReuseIdentifier: Constant.NEWS_TABLE_VIEW_CELL)
        handlerCallback()
        
        searchModel.getAllNews(callback: {[weak self ] arrNews in
            self?.searchTableView.data = arrNews
            self?.searchTableView.reloadData()
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        setLeftTitle()
    }
    private func handlerCallback() {
        searchTableView.onTouchNewsCallback = { [weak self] (item) in
            self?.openWebKitView(item: item)
        }
        searchBar.onTextDidChangeCallback = { [weak self] (text) in
            self?.searchModel.searchNewsWithCategory(withArrayTextSearch: text, callBack: { (arrNews) in
                self?.searchTableView.data.removeAll()
                self?.searchTableView.data.append(contentsOf: arrNews)
                self?.searchTableView.reloadData()
            })
        }
        handleScrollTableView()
    }
    func handleScrollTableView() {
        searchTableView.scrollDownCallback = {
            animationHideSearchBar(constant: 56)
        }
        searchTableView.scrollUpCallback = {[weak self] in
            guard let isText = self?.searchBar?.isTextSearching else {return}
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
    private func setLeftTitle() {
        let btnLeftFirst = UIBarButtonItem()
        let label = UILabel()
        label.text = LanguageManager.getText(withKey: .search)
        label.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        btnLeftFirst.customView = label
        navigationController?.navigationBar.topItem?.leftBarButtonItem = btnLeftFirst
        
        searchBar.placeholder = LanguageManager.getText(withKey: .search)
    }
}
