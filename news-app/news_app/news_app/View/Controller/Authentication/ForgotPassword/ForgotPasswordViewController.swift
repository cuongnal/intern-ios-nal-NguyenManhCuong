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
        authenModel.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        viewResendMail.isHidden = true
    }
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnReset(_ sender: Any) {
        authenModel.sendEmailResetPassword(withEmail: inputEmail.text!, callback: {[weak self] err in
            if err.isEmpty {
                self?.showToast(text: LanguageManager.getText(withKey: .errorSentMail))
                self?.viewResendMail.isHidden = false
            }
            else {
                self?.showAlert(message: LanguageManager.getText(withKey: .invalidEmail), titleAction: .oke, action: .cancel)
            }
        })
    }
    @IBAction func emailEditingChanged(_ sender : Any) {
        labelEmail.alpha = inputEmail.text?.isEmpty == true ? 0 : 1
        
        guard authenModel.checkErrorEmail(email: inputEmail.text) == true else{
            btnReset.setColorButton(flag: false)
            return
        }
        btnReset.setColorButton(flag: true)
    }
    override func setUpLanguage() {
        btnReset.setTitle(LanguageManager.getText(withKey: KeyText.reset), for: .normal)
        titleLogo.text = LanguageManager.getText(withKey: KeyText.news24)
        labelNoti.text = LanguageManager.getText(withKey: KeyText.inputEmailToBeSentResetPassword)
        btnReSend.setTitle(LanguageManager.getText(withKey: KeyText.reSend), for: .normal)
        titleResend.text = LanguageManager.getText(withKey: KeyText.didNotReceiveAnEmail)
        
    }
    
    @IBAction func onTouchResend(_ sender: Any) {
        
    }
    
    @IBOutlet weak var viewResendMail: UIView!
    @IBOutlet weak var btnReSend: UIButton!
    @IBOutlet weak var titleResend: UILabel!
    @IBOutlet weak var titleLogo: UILabel!
    @IBOutlet weak var labelNoti: UILabel!
}

