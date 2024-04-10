//
//  AppNavigationController.swift
//  news_app
//
//  Created by user on 4/10/24.
//

import Foundation
import UIKit
class AppNavigationViewController : UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    //    self.isNavigationBarHidden = true
        self.navigationItem.leftBarButtonItem = nil
        let signInUp : UIViewController!
        let home : UIViewController!
        signInUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInUp") as? SignUpSignInViewController
        home = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarHome") as? TabBarController

        if UserDefaults.getUser() == nil {
            self.pushViewController(signInUp, animated: true)
        }
        else {
            self.viewControllers.append(signInUp)
            self.pushViewController(home, animated: true)
        }
        self.viewControllers.remove(at: 0)
        
    }
}
class UILoadingController : UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}
