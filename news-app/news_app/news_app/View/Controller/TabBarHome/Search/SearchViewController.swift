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
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.register(UINib(nibName: Constant.NEWS_TABLE_VIEW_CELL, bundle: .main), forCellReuseIdentifier: Constant.NEWS_TABLE_VIEW_CELL)
        handlerCallBack()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        setLeftTitle()
        searchModel.getAllNews(callBack: {[weak self ] arrNews in
            self?.searchTableView.data = arrNews
            self?.searchTableView.reloadData()
        })
    }
    private func handlerCallBack() {
        searchTableView.callBack = { [weak self] (item) in
            self?.openWebKitView(item: item)
        }
    }
    private func setLeftTitle() {
        let btnLeftFirst = UIBarButtonItem()
        let label = UILabel()
        label.text = Constant.SEARCH
        label.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        btnLeftFirst.customView = label
        navigationController?.navigationBar.topItem?.leftBarButtonItem = btnLeftFirst
    }
}
