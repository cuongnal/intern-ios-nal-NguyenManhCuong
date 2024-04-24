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
        
        NotificationCenter.default
                          .addObserver(self, selector:#selector(onChangeLanguage),
                         name: NSNotification.Name ("ABC"),object: nil)
        
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
    func showAlert (withTitle title : String = LanguageManager.getText(withKey: .error), message : String) {
        cancelLoading()
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: LanguageManager.getText(withKey: .cancel), style: .cancel, handler: {[weak self] _ in
            self?.dismiss(animated: false)
        })
        alert.addAction(action)
        present(alert, animated: true)
    }
    // hiện popover
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
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
