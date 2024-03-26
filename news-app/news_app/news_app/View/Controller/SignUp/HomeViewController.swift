//
//  HomeController.swift
//  news_app
//
//  Created by hiepnv1 on 19/03/2024.
//

import UIKit
import Foundation

class HomeViewController : UIViewController, XMLParserDelegateCallBack{
    
    var selectedItemi : IndexPath = IndexPath(row: 0, section: 0)
    
    @IBOutlet weak var homeCollectionView : HomeCollectionView!
    @IBOutlet weak var homeTableView : HomeTableView!
    var xmlParserToObject : XMLParserToObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeCollectionView.list = Constant.VN_EXPRESS
        
        homeCollectionView.reloadData()
        
        xmlParserToObject = XMLParserToObject()
        xmlParserToObject.callBack = self
        startParser(url: URL(string: Constant.VN_EXPRESS[0].url)!, category: Constant.VN_EXPRESS[0])
        onClickCell()
    }
    func parsingWasFinished(arrNews: [News]) {
        homeTableView.data.removeAll()
        homeTableView.data.append(contentsOf: arrNews)
        homeTableView.reloadData()
        
    }
    func startParser(url : URL, category : Category) {
        xmlParserToObject.callFromByUrl(url: url,category: category)
    }
    func onClickCell() {
        homeCollectionView.onClickCallBack = { category in
            if let url = URL(string: category.url) {
                print(category.title)
                self.startParser(url: url, category: category)
            }
        }
    }
    
    @objc private func back() {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
}


