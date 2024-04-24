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
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .done, target: self, action: #selector(goBack))
        setUpLanguage()
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
    func setUpLanguage() {
        btnReset.setTitle(LanguageManager.setText(withKey: KeyText.RESET), for: .normal)
        titleLogo.text = LanguageManager.setText(withKey: KeyText.NEWS_24)
        labelNoti.text = LanguageManager.setText(withKey: KeyText.INPUT_EMAIL_TO_BE_SENT_RESET_PASSWORD)
        btnReSend.text = LanguageManager.setText(withKey: KeyText.RE_SEND)
        titleResend.text = LanguageManager.setText(withKey: KeyText.DID_NOT_RECEIVE_AN_EMAIL)
        
    }
    
    @IBOutlet weak var btnReSend: UILabel!
    @IBOutlet weak var titleResend: UILabel!
    @IBOutlet weak var titleLogo: UILabel!
    @IBOutlet weak var labelNoti: UILabel!
}

