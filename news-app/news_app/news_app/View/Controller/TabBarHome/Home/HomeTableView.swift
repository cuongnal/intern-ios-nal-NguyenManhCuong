//
//  HomeTableView.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import UIKit
class HomeTableView : NewsTableView {
    var flagCheckScrollBySystem = false
    func setUpHomeTableView(arrNews: [News]) {
        self.data.removeAll()
        self.data.append(contentsOf: arrNews)
        self.reloadData()
        if data.count != 0 {
            self.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
}
