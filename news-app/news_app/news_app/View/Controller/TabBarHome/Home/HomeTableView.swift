//
//  HomeTableView.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import UIKit
class HomeTableView : NewsTableView {
    
    func setUpHomeTableView(arrNews: [News]) {
        if data.count != 0 {
            self.data.removeAll()
        }
        self.data.append(contentsOf: arrNews)
        self.reloadData()
    }
    
}
