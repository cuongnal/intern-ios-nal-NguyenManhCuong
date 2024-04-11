//
//  CategoryCollectionView.swift
//  news_app
//
//  Created by user on 4/11/24.
//

import Foundation
import UIKit

class CategoryCollectionView : UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    var oldSelectedItemAt : IndexPath = IndexPath(row: 0, section: 0)
    
    var callBack : ((Category) -> ())?
    var list : [Category] = []
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CATEGORY_COLLECTION_VIEW_CELLS, for: indexPath) as! HomeCollectionViewCell
        cell.label.text = list[indexPath.item].title
        cell.setBackGround(flag: indexPath == oldSelectedItemAt)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath == oldSelectedItemAt {return}
        
        (collectionView.cellForItem(at: indexPath) as! HomeCollectionViewCell).setBackGround(flag: true)
        (collectionView.cellForItem(at: oldSelectedItemAt) as? HomeCollectionViewCell)?.setBackGround(flag: false)
        
        oldSelectedItemAt = indexPath
        
        callBack!(list[indexPath.row])
    }
    
}
