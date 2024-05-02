//
//  HideCollectionView.swift
//  news_app
//
//  Created by Manhcuong on 25/04/2024.
//

import Foundation
import UIKit

class HideCollectionView : UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    var listItemShow : [Int] = []
    var typeSource : TypeSource?
    
    var data : [Category] = []
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        self.dataSource = self
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return CGSize(width: width/2 - 10, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CATEGORY_COLLECTION_VIEW_CELL, for: indexPath) as! CategoryCollectionViewCell
        
        cell.label.text = LanguageManager.getText(withString: data[indexPath.item].title)
        cell.label.numberOfLines = 0
        for (_,itemSelect) in listItemShow.enumerated() {
            if data[indexPath.item].index == itemSelect {
                cell.setBackGround(flag: true)
                return cell
            }
        }
        
        cell.setBackGround(flag: false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for (indexP,item) in listItemShow.enumerated() {
            if data[indexPath.row].index == item {
                
                guard listItemShow.count > 1 else { return }
                
                (collectionView.cellForItem(at: indexPath) as? HomeCollectionViewCell)?.setBackGround(flag: false)
                listItemShow.remove(at: indexP)
                print(listItemShow)
                return
            }
        }
        (collectionView.cellForItem(at: indexPath) as! HomeCollectionViewCell).setBackGround(flag: true)
        listItemShow.append(data[indexPath.item].index)
        print(listItemShow)
    }
    
    
}

//class AlightLeftCell : UICollectionViewFlowLayout {
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//            guard let originalAttributes = super.layoutAttributesForElements(in: rect) else {
//                return nil
//            }
//            var leftMargin: CGFloat = 0.0
//            var lastY: Int = 0
//            return originalAttributes.map {
//                let changedAttribute = $0
//                if Int(changedAttribute.center.y.rounded()) != lastY {
//                    leftMargin = sectionInset.left
//                }
//                changedAttribute.frame.origin.x = leftMargin
//                lastY = Int(changedAttribute.center.y.rounded())
//                leftMargin += changedAttribute.frame.width + minimumInteritemSpacing
//                return changedAttribute
//            }
//        }
//}
