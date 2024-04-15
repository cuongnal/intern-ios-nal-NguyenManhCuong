//
//  AppNavigationController.swift
//  news_app
//
//  Created by user on 4/10/24.
//

import Foundation
import UIKit
class AuthNavigationController : UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        AppNavigationModel().importDataDefault()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back"),
        //                                                                                      style: .done,
        //                                                                                      target: self,
        //                                                                                      action: nil)
        //    }
    }
}
class UILoadingController : UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}
