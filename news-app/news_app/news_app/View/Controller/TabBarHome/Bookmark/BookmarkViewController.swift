//
//  BookmarkViewController.swift
//  news_app
//
//  Created by hiepnv1 on 26/03/2024.
//

import Foundation
import UIKit

class BookmarkViewController : BaseViewController {
    
    @IBOutlet weak var bookmarkCollectionView: BookmarkCollectionViewCell!
    @IBOutlet weak var bookmarkTableView: BookmarkTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
}
