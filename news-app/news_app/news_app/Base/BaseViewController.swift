//
//  BaseViewController.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation
import UIKit

class BaseViewController : UIViewController, BaseModelDelegate, UIPopoverPresentationControllerDelegate, UIGestureRecognizerDelegate {
    private lazy var loadingController = LoadingViewController()
    private lazy var popover = PopoverTableViewCellVC(nibName: "PopoverViewController", bundle: nil) as PopoverTableViewCellVC
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
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
    // hiện popover
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func setRootViewControllerApp(withConstantNavKey nav : String) {
        if nav == Constant.Key.NAV_HOME  {
            let navHome = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: nav) as! HomeNavigationController
            UIApplication.shared.windows.first?.rootViewController = navHome
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
        else {
            let navHome = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: nav) as! AuthNavigationController
            UIApplication.shared.windows.first?.rootViewController = navHome
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
        
    }
}
