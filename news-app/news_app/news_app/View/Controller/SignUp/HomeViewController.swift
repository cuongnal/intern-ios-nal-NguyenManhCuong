//
//  HomeController.swift
//  news_app
//
//  Created by hiepnv1 on 19/03/2024.
//

import UIKit
import Foundation
//
//  HomeController.swift
//  news_app
//
//  Created by hiepnv1 on 19/03/2024.
//

import UIKit
import Foundation
class HomeViewController : UIViewController, XMLParserDelegateCallBack{
    
    var itemOldOnClick : IndexPath = IndexPath(row: 0, section: 0)
    
   
    @IBOutlet weak var homeCollectionView : HomeCollectionView!
    @IBOutlet weak var homeTableView : HomeTableView!
    var xmlParserToObject : XMLParserToObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeCollectionView.list = Constant.VN_EXPRESS

        homeCollectionView.reloadData()
        
        let url = URL(string: "https://vnexpress.net/rss/the-gioi.rss")!
        xmlParserToObject = XMLParserToObject()
        xmlParserToObject.callBack = self
        xmlParserToObject.callFromByUrl(url: url)
        onClickCell()
    }
    func parsingWasFinished(arrNews: [News]) {
        homeTableView.data.removeAll()
        homeTableView.data.append(contentsOf: arrNews)
        homeTableView.reloadData()
        
    }
    func startParser(url : URL) {
        xmlParserToObject.callFromByUrl(url: url)
    }
    func onClickCell() {
        homeCollectionView.onClickCallBack = { category in
            if let url = URL(string: category.url) {
                self.startParser(url: url)
            }
        }
    }
    
    @objc private func back() {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
}


