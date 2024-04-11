//
//  BaseViewController.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation
import UIKit

class BaseViewController : UIViewController, BaseModelDelegate {
    private var loadingController = LoadingViewController()
    private var backgroundLoading : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
