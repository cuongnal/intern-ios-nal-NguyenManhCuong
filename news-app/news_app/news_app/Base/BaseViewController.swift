//
//  BaseViewController.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation
import UIKit

class BaseViewController : UIViewController, BaseModelDelegate, UIPopoverPresentationControllerDelegate {
    private lazy var loadingController = LoadingViewController()
    private lazy var popover = PopoverTableViewCellVC(nibName: "PopoverViewController", bundle: nil) as PopoverTableViewCellVC
    override func viewDidLoad() {
        super.viewDidLoad()
        receiverNotificationCenter()
    }
    func openWebKitView(item : News) {
        guard let acc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else {
            return
        }
        acc.newsItem = item
        navigationController?.pushViewController(acc, animated: true)
    }
    func startLoading() {
        loadingController.modalPresentationStyle = .overFullScreen
        present(loadingController, animated: false)
    }
    func cancelLoading() {
        loadingController.dismiss(animated: false)
    }
    func showAlertError (withTitle title : String = Constant.Error.LABLE_ERROR, error : String) {
        cancelLoading()
        let alert : UIAlertController! = UIAlertController(title: title, message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: {[weak self] _ in
            self?.dismiss(animated: false)
        })
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    func receiverNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(oke(_:)), name: NSNotification.Name(Constant.POP_OVER_NOTIFICATION), object: nil)
    }
    @objc func oke(_ notification: Notification) {
        let positionAnchor = (notification.userInfo?[Constant.ANCHOR_POPOVER]) as? UIButton
        let itemNews = (notification.userInfo?[Constant.Key.KEY_NEWS_BOOKMARK]) as? News
        popover.setUp(anchor: positionAnchor!)
        popover.popoverPresentationController?.delegate = self
        present(popover, animated: true, completion: nil)
        
        popover.callBack = {[weak self] (type) in
            if type == .bookmark {
                self?.saveBookmark(news : itemNews)
            }
            else {
                self?.shareNews(news: itemNews)
            }
        }
    }
    private func saveBookmark(news : News?) {
        guard let news = news else {
            return
        }
        BaseModel.saveBookmark(withNews: news)
    }
    open func shareNews(news : News?) {}
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
