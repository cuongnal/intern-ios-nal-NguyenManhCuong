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
        NotificationCenter.default.addObserver(self, selector: #selector(showPopover(_:)), name: NSNotification.Name(Constant.POP_OVER_NOTIFICATION), object: nil)
    }
    @objc func showPopover(_ notification: Notification) {
        let positionAnchor = (notification.userInfo?[Constant.ANCHOR_POPOVER]) as? UIButton
        let itemNews = (notification.userInfo?[Constant.Key.KEY_NEWS_BOOKMARK]) as? News
        guard let positionAnchor = positionAnchor else {
            guard let item = itemNews else {return}
            saveBookmark(news: item)
            return
        }
        popover.setUp(anchor: positionAnchor)
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
    func saveBookmark(news : News?) {
        guard let news = news else {
            return
        }
        BaseModel.saveBookmark(withNews: news)
        self.show(text: Constant.SAVED_BOOKMARK)
    }
    func show(text : String) {
        let toast = UITextView(frame: CGRect(x: self.view.frame.size.width/4, y: self.view.frame.size.height * 5 / 6, width: (self.view.frame.size.width/8)*4, height: 40))
        toast.backgroundColor = UIColor.black
        toast.textColor = Constant.COLOR_WHITE
        toast.text = text
        toast.textAlignment = .center
        toast.alpha = 1
        toast.font = UIFont.systemFont(ofSize: 16)
        toast.layer.cornerRadius = 20
        toast.clipsToBounds = true
        toast.textContainerInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0);
        toast.updateConstraintsIfNeeded()
        self.view.addSubview(toast)
        toast.didMoveToSuperview()
        UIView.animate(withDuration: 4, delay: 0.1, options: .curveEaseInOut, animations: {
            toast.alpha = 0
        }, completion: {_ in toast.removeFromSuperview()})
    }
    open func shareNews(news : News?) {}
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
