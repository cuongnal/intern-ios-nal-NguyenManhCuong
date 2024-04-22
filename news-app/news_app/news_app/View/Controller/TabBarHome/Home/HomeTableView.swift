//
//  HomeTableView.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import UIKit
class HomeTableView : NewsTableView {
    var scrollUpCallback : (() -> Void)?
    var scrollDownCallback : (() -> Void)?
    var flagCheckScrollBySystem = false
    func setUpHomeTableView(arrNews: [News]) {
        self.data.removeAll()
        self.data.append(contentsOf: arrNews)
        self.reloadData()
        if data.count != 0 {
            self.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    private var lastContentOffset: CGFloat = 0
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if lastContentOffset < scrollView.contentOffset.y {
            scrollUpCallback?()
        } else if self.lastContentOffset >= scrollView.contentOffset.y {
            scrollDownCallback?()
        }
    }
}
