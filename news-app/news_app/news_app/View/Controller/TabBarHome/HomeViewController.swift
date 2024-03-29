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
    var xmlParserToObject : XMLParserToObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeCollectionView.list = Constant.CATEGORY_VN_EXPRESS
        
        homeCollectionView.reloadData()
        
        xmlParserToObject = XMLParserToObject.getInstance()
        xmlParserToObject.delegate = self
        startParser(url: URL(string: Constant.CATEGORY_VN_EXPRESS[0].url)!, category: Constant.CATEGORY_VN_EXPRESS[0])
        onClickCell()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
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
        homeCollectionView.callBack = {[weak self] category in
            if let url = URL(string: category.url) {
                print(category.title)
                self?.startParser(url: url, category: category)
            }
        }
        
        homeTableView.callBack = {[weak self] item in
            self?.openWebKitView(item: item)
        }
    }
    func openWebKitView(item : News) {

        guard let acc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else {
            return
        }
        acc.newsItem = item
        navigationController?.pushViewController(acc, animated: true)
    }

    @objc private func back() {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
}


