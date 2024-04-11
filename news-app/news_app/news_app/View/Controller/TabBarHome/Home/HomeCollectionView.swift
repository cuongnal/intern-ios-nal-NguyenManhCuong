//
//  HomeCollectionView.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import SwiftUI

class HomeCollectionView : CategoryCollectionView {
    override func reloadData() {
        super.reloadData()
        oldSelectedItemAt = IndexPath(item: 0, section: 0)
        self.layoutIfNeeded()
        if list.isEmpty {
            return
        }
        self.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
        
        // khi bằng reload mà list khác không, chứng tỏ là mới mở app, hoặc đổi source báo, nên gọi callback luôn
        if list.count > 0 {
            callBack?(list[0])
        }
    }
}
