//
//  HomeController.swift
//  news_app
//
//  Created by hiepnv1 on 19/03/2024.
//

import UIKit
import Foundation

class HomeViewController : UIViewController, XMLParserToObjectDelegate, UIPopoverPresentationControllerDelegate{
    
    @IBOutlet weak var homeCollectionView : HomeCollectionView!
    @IBOutlet weak var homeTableView : HomeTableView!
    var popover : PopoverViewController!
    @IBOutlet weak var iconNotification: UIButton!
    var xmlParserToObject : XMLParserToObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        receiverNotificationCenter()
        xmlParserToObject = XMLParserToObject.getInstance()
        setUpHomeCollectionView()
        popover = PopoverViewController(nibName: "PopoverViewController", bundle: nil) as PopoverViewController
        xmlParserToObject.delegate = self
        handlerCallBack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startParser(category: Constant.CATEGORY_VN_EXPRESS[0])
    }
    
    func setUpHomeCollectionView(typeSource : TypeClickPopover = .vnExpress) {
        homeCollectionView.list.removeAll()
        homeCollectionView.reloadData()
        homeCollectionView.list = typeSource == .vnExpress ? Constant.CATEGORY_VN_EXPRESS : Constant.CATEGORY_TUOI_TRE
        homeCollectionView.reloadData()
        startParser(category: homeCollectionView.list[0])
    }
    
    
    func parsingWasFinished(arrNews: [News]) {
        homeTableView.data.removeAll()
        homeTableView.data.append(contentsOf: arrNews)
        homeTableView.reloadData()
        
    }
    
    func startParser(category : Category) {
        xmlParserToObject?.callFromByUrl(category: category)
    }
    func handlerCallBack() {
        homeCollectionView.callBack = {[weak self] category in
            if URL(string: category.url) != nil {
                print(category.title)
                self?.startParser(category: category)
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
    @IBAction func onTouchBtnNotification(_ sender: Any) {
        popover.setUp(anchor: iconNotification, hiddenDirections: false)
        popover.popoverPresentationController?.delegate = self
        present(popover, animated: true, completion: nil)
        popover.callBack = {[weak self]
            (type) in
            if type == .vnExpress || type == .tuoiTre {
                self?.setUpHomeCollectionView(typeSource: type)
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func receiverNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(oke(_:)), name: NSNotification.Name(Constant.POP_OVER_NOTIFICATION), object: nil)
    }
    @objc func oke(_ notification: Notification) {
        let positionAnchor = (notification.userInfo?[Constant.ANCHOR_POPOVER]) as? UIButton
        popover.setUp(anchor: positionAnchor!, hiddenDirections: true)
        popover.popoverPresentationController?.delegate = self
        present(popover, animated: true, completion: nil)
        popover.callBack = {[weak self]
            (type) in
            if type == .vnExpress || type == .tuoiTre {
                self?.setUpHomeCollectionView(typeSource: type)
            }
        }
    }
}


