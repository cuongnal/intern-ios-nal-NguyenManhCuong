//
//  HomeController.swift
//  news_app
//
//  Created by hiepnv1 on 19/03/2024.
//

import UIKit
import Foundation
class HomeViewController : UIViewController{
    var itemOldOnClick : IndexPath = IndexPath(row: 0, section: 0)
    
    @IBOutlet weak var filterImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView : UITableView!
    lazy var homeCollectionView = HomeCollectionView(frame: collectionView.bounds, list: list)
    lazy var homeTableView = HomeTableView(frame: tableView.bounds, data: dataNews)
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = homeCollectionView
        collectionView.dataSource = homeCollectionView
        
        tableView.dataSource = homeTableView
        tableView.delegate = homeTableView
        
        filterImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(back))
        filterImage.addGestureRecognizer(gesture)
        
        
    }
    @objc private func back() {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    let list = ["For you","Top","World","Politics","Entertainment","Science"]
    let dataNews = [News(imageNews: "ok", titleNews: "oewryk", timeNews: "ykdfb", authorNews: "kkk", typeNews: "fdgk"),
                    News(imageNews: "ok", titleNews: "psdfsdfk", timeNews: "pk", authorNews: "ewk", typeNews: "oqưerk"),
                    News(imageNews: "ok", titleNews: "osdfsdk", timeNews: "osfdk", authorNews: "kewr", typeNews: "sfdgk"),
                    News(imageNews: "ok", titleNews: "gjytk", timeNews: "pok", authorNews: "kegr", typeNews: "qrek"),
                    News(imageNews: "ok", titleNews: "dfsgk", timeNews: "dsfk", authorNews: "ewrk", typeNews: "sdfgk"),
                    News(imageNews: "ok", titleNews: "pfgk", timeNews: "dsfk", authorNews: "kxcbt", typeNews: "sdfk")]
    
}


