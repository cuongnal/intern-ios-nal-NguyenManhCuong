//
//  ForgotPasswordViewController.swift
//  news_app
//
//  Created by hiepnv1 on 25/03/2024.
//

import Foundation
import UIKit

class ForgotPasswordViewController : BaseViewController{
    
    
    @IBOutlet weak var inputEmail: CustomTextField!
    
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var btnReset: ButtonLogin!
    let authenModel = AuthenticationModel(categoryRepository: CategoryRepositoryImp(), userRepository: UsersRepositoryImp() )
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back"),
                                                                style: .done,
                                                                target: self,
                                                                action: #selector(self.goBack))
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnReset(_ sender: Any) {
        showToast(text: Constant.Error.ERROR_SENT_MAIL)
    }
    @IBAction func emailEditingChanged(_ sender : Any) {
        labelEmail.alpha = inputEmail.text?.isEmpty == true ? 0 : 1
        
        guard authenModel.checkErrorEmail(email: inputEmail.text) == true else{
            btnReset.setColorButton(flag: false)
            return
        }
        btnReset.setColorButton(flag: true)
    }
}

