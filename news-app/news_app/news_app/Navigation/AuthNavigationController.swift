//
//  AppNavigationController.swift
//  news_app
//
//  Created by user on 4/10/24.
//

import Foundation
import UIKit
class AuthNavigationController : UINavigationController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        AppNavigationModel().importDataDefault()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
class UILoadingController : UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}
