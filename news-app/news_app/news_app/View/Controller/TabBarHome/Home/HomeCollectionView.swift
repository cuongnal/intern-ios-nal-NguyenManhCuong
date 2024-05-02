//
//  HomeCollectionView.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import SwiftUI

class HomeCollectionView : CategoryCollectionView, UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    
    var callbackDragDropItem : (([Category]) -> ())?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.dragInteractionEnabled = true
        self.dragDelegate = self
        self.dropDelegate = self
    }
    override func reloadData() {
        super.reloadData()
        oldSelectedItemAt = IndexPath(item: 0, section: 0)
        
        self.layoutIfNeeded()
        
        if data.isEmpty {
            return
        }
        self.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
        
        // khi bằng reload mà list khác không, chứng tỏ là mới mở app, hoặc đổi source báo, nên gọi callback luôn
        if data.count > 0 {
            onTouchItemCallback?(data[0])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dataNews = data[indexPath.row]
        let item = NSItemProvider(object: "\(dataNews)" as NSString)
        let itemDrag = UIDragItem(itemProvider: item)
        return [itemDrag]
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let destinationIndexPath = coordinator.destinationIndexPath else {return} // kiểm tra xem có vị trí đích để thả không

        let items = coordinator.items
        if let item = items.first, let draggedIndexPath = item.sourceIndexPath {
            
            collectionView.performBatchUpdates( { [weak self] in
                guard let self = self else {return}
                collectionView.insertItems(at: [destinationIndexPath])
                collectionView.deleteItems(at: [draggedIndexPath])
                coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)   // hoàn thành việc thả
                
                let dataCellOld = data[draggedIndexPath.item]
                
                self.data.remove(at: draggedIndexPath.item)
                self.data.insert(dataCellOld, at: destinationIndexPath.item)
                
                switch (true) {
                case self.oldSelectedItemAt == draggedIndexPath :
                    self.oldSelectedItemAt = destinationIndexPath
                case draggedIndexPath < self.oldSelectedItemAt && destinationIndexPath >= self.oldSelectedItemAt :
                    self.oldSelectedItemAt.row -= 1
                case draggedIndexPath > self.oldSelectedItemAt && destinationIndexPath <= self.oldSelectedItemAt :
                    self.oldSelectedItemAt.row += 1
                default : break
                }
                
            },completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        let d = UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        return d
    }
    func collectionView(_ collectionView: UICollectionView, dropSessionDidEnd session: UIDropSession) {
        super.reloadData()
        callbackDragDropItem?(self.data)
    }

}

@propertyWrapper
struct CustomAttribute {
    private var value: String

    init() {
        self.value = ""
    }

    var wrappedValue: String {
        get { return value }
        set { value = "Custom: \(newValue)" }
    }
}


