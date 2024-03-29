//
//  HomeController.swift
//  news_app
//
//  Created by hiepnv1 on 19/03/2024.
//

import UIKit
import Foundation

class HomeViewController : UIViewController, XMLParserToObjectDelegate{
    
    
    @IBOutlet weak var homeCollectionView : HomeCollectionView!
    @IBOutlet weak var homeTableView : HomeTableView!
    weak var xmlParserToObject : XMLParserToObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.tabBarController?.navigationItem.hidesBackButton = false
        homeCollectionView.list = Constant.CATEGORY_VN_EXPRESS
        
        homeCollectionView.reloadData()
        
        xmlParserToObject = XMLParserToObject.getInstance()
        xmlParserToObject.callBack = self
        startParser(url: URL(string: Constant.CATEGORY_VN_EXPRESS[0].url)!, category: Constant.CATEGORY_VN_EXPRESS[0])
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


