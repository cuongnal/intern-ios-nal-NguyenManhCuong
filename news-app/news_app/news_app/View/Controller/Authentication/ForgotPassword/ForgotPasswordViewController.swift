//
//  ForgotPasswordViewController.swift
//  news_app
//
//  Created by hiepnv1 on 25/03/2024.
//

import Foundation
import UIKit

class ForgotPasswordViewController : UIViewController{
    
    
    @IBOutlet weak var inputEmail: CustomTextField!
    
    @IBOutlet weak var labelInputEmail: UILabel!
    @IBOutlet weak var btnReset: ButtonLogin!
    let authenModel = AuthenticationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .done, target: self, action: #selector(self.goBack))
//        let btnLeftFirst = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goBack))
//        navigationItem.leftBarButtonItems = [btnLeftFirst]
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnReset(_ sender: Any) {
        showToast()
    }
//    func showToast(message: String, duration: TimeInterval = 2.0) {
//        let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
//        present(alert, animated: true)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
//        view.addGestureRecognizer(tapGesture)
//
//    }
//    @objc func handleTapGesture(sender: UITapGestureRecognizer) {
//
//    }
}
