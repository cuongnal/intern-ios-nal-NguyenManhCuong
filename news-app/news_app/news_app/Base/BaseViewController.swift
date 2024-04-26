//
//  BaseViewController.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation
import UIKit

class BaseViewController : UIViewController, BaseModelDelegate, UIGestureRecognizerDelegate {
    private lazy var loadingController = LoadingViewController()
    lazy var isKeyboardShowing = false
    lazy var keyboardHeight :CGFloat = 0
    private lazy var popover = PopoverTableViewCellVC(nibName: "PopoverViewController", bundle: nil) as PopoverTableViewCellVC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default
            .addObserver(self, selector:#selector(onChangeLanguage),
                         name: Constant.NSNoti.CHANGE_LANGUAGE,object: nil)
        
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        isKeyboardShowing = true
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        isKeyboardShowing = false
    }
    @objc private func onChangeLanguage() {
        setUpLanguage()
    }
    func setUpLanguage() {}
    
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
    func showAlert (withTitle title : KeyText = .error, message : String, titleAction : KeyText, action : KeyText) {
        cancelLoading()
        let alert : UIAlertController = UIAlertController(title: LanguageManager.getText(withKey: title), message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: LanguageManager.getText(withKey: titleAction), style: .cancel, handler: {[weak self] _ in
            self?.dismiss(animated: false)
            if action == KeyText.oke {
                self?.onTouchOkeAlert()
            }
        })
        alert.addAction(action)
        present(alert, animated: true)
    }
    func onTouchOkeAlert() {}
    func setRootViewControllerApp(withConstantNavKey nav : String) {
        if nav == Constant.Key.NAV_HOME  {
            let navHome = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: nav) as! HomeNavigationController
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let window = windowScene.windows.first {
                    window.rootViewController = navHome
                    window.makeKeyAndVisible()
                }
            }
        }
        else {
            let navAuth = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: nav) as! AuthNavigationController
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let window = windowScene.windows.first {
                    window.rootViewController = navAuth
                    window.makeKeyAndVisible()
                }
            }
        }
        
    }
    func presenShareSheet(withNews news : News) {
        guard let url = URL(string: news.link) else {return}
        
        let shareSheetView = UIActivityViewController (activityItems: [url],
                                                       applicationActivities: nil)
        present(shareSheetView, animated: true)
    }
}


extension BaseViewController : UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
