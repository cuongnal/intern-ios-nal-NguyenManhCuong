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
        if data.count != 0 {
            
            self.data.removeAll()
            self.data.append(contentsOf: arrNews)
            self.reloadData()
            self.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        } else {
            self.data.append(contentsOf: arrNews)
            self.reloadData()
        }
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        if flagCheckScrollBySystem {
            
        }
    }
}
