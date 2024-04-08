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
}
