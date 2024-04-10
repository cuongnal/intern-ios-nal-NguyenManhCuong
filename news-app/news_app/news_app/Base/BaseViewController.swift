//
//  BaseViewController.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation
import UIKit

class BaseViewController : UIViewController, BaseModelDelegate {
    var loadingController = LoadingViewController()
    var backgroundLoading : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
