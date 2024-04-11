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
    let bookmarkModel = BookmarkModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        bookmarkTableView.register(UINib(nibName: Constant.NEWS_TABLE_VIEW_CELL, bundle: .main), forCellReuseIdentifier: Constant.NEWS_TABLE_VIEW_CELL)
        bookmarkCollectionView.register(UINib(nibName: Constant.CATEGORY_COLLECTION_VIEW_CELL, bundle: .main), forCellWithReuseIdentifier: Constant.CATEGORY_COLLECTION_VIEW_CELL)
        
        
        bookmarkModel.getCategoryAndNews(callBack: {[weak self](arrNews, arrCategory) in
            self?.bookmarkCollectionView.data = arrCategory
            self?.bookmarkCollectionView.reloadData()
        })
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
}
