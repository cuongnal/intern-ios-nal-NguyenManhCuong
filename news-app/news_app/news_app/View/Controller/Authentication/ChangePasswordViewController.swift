//
//  ChangePasswordViewController.swift
//  news_app
//
//  Created by Manhcuong on 21/04/2024.
//

import Foundation
import UIKit

class ChangePasswordViewController : BaseViewController {
    
    @IBOutlet weak var labelCurrentPassword: UILabel!
    
    @IBOutlet weak var inputCurrentPassword: CustomTextField!
    
    @IBOutlet weak var errorCurrentPassword: UILabel!
    
    @IBOutlet weak var labelNewPassword: UILabel!
    
    @IBOutlet weak var inputNewPassword: CustomTextField!
    
    @IBOutlet weak var errorNewPassword: UILabel!
    
    @IBOutlet weak var labelConfirmPassword: UILabel!
    
    @IBOutlet weak var inputConfirmPassword: CustomTextField!
    
    @IBOutlet weak var errorConfirmPassword: UILabel!
    
    private let authenModel = AuthenticationModel(categoryRepository: CategoryRepositoryImp(), userRepository: UsersRepositoryImp())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authenModel.delegate = self
        setButton()
        setTextLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func editingChangeCurrentPassword(_ sender: Any) {
        labelCurrentPassword.alpha = inputCurrentPassword.text?.isEmpty == true ? 0 : 1
        if inputCurrentPassword.text?.isNotEmpty() == true
            && authenModel.checkErrorPassword(password: inputNewPassword?.text)
            && inputNewPassword.text == inputConfirmPassword.text{
            setButtonSave(isEnable: true)
        }
        else {
            setButtonSave(isEnable: false)
        }
    }
    
    @IBAction func edittingChangeNewPassword(_ sender: Any) {
        labelNewPassword.alpha = inputNewPassword.text?.isEmpty == true ? 0 : 1
        
        if authenModel.checkErrorPassword(password: inputNewPassword.text){
            errorNewPassword.alpha = 0
        }
        else {
            if inputNewPassword.text?.isEmpty == true {
                errorNewPassword.alpha = 0
            }
            else {
                errorNewPassword.alpha = 1
            }
        }
        
        if (authenModel.checkErrorPassword(password: inputConfirmPassword.text)
            && inputNewPassword.text == inputConfirmPassword.text)
            || inputNewPassword.text?.isEmpty == true
        {
            errorConfirmPassword.alpha = 0
        }
        else {
            if inputConfirmPassword.text?.isNotEmpty() == true {
                errorConfirmPassword.alpha = 1
            }
            else {
                errorConfirmPassword.alpha = 0
            }
        }
        
        checkEnableButtonSave()
    }
    
    @IBAction func editingChangeConfirmPassword(_ sender: Any) {
        labelConfirmPassword.alpha = inputConfirmPassword.text?.isEmpty == true ? 0 : 1
        
        if authenModel.checkErrorPassword(password: inputConfirmPassword.text)
            || inputNewPassword.text?.isEmpty == true
        {
            errorConfirmPassword.alpha = 0
        }
        else {
            if inputConfirmPassword.text?.isEmpty == true {
                errorConfirmPassword.alpha = 0
            }
            else {
                errorConfirmPassword.alpha = 1
            }
        }
        
        checkEnableButtonSave()
    }
    private func checkEnableButtonSave() {
        if inputCurrentPassword.text?.isNotEmpty() == true
            && authenModel.checkErrorPassword(password: inputNewPassword?.text)
            && inputNewPassword?.text == inputConfirmPassword?.text{
            setButtonSave(isEnable: true)
        }
        else {
            setButtonSave(isEnable: false)
        }
    }
    
    private func setButton() {
        let btnLeftFirst = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goBack))
        let btnLeftSecond = UIBarButtonItem(title: LanguageManager.getText(withKey: .account), style: .plain, target: nil, action: nil)
        
        btnLeftSecond.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ], for: .normal)
        navigationItem.leftBarButtonItems = [btnLeftFirst,btnLeftSecond]
        
        setButtonSave(isEnable: false)
    }
    private func setButtonSave(isEnable : Bool) {
        let btnSave = UIBarButtonItem(title: LanguageManager.getText(withKey: .save), style: .plain, target: self, action:#selector (saveChangePassword))
        btnSave.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ], for: .normal)
        btnSave.isEnabled = isEnable
        
        navigationItem.rightBarButtonItems = [btnSave]
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
        
    }
    @objc private func saveChangePassword() {
        authenModel.changePassword(withCurrentPassword: inputCurrentPassword.text!, newPassword: inputNewPassword.text!, callback: { [weak self] isSuccessChangePassword, message in
            if isSuccessChangePassword {
                self?.showAlert(withTitle: LanguageManager.getText(withKey: .success), message: message)
            }
            else {
                self?.showAlert(message: message)
            }
        })
    }
    private func setTextLabel() {
        inputNewPassword.placeholder = LanguageManager.getText(withKey: .newPassword)
        labelNewPassword.text = LanguageManager.getText(withKey: .newPassword)
        errorNewPassword.text = LanguageManager.getText(withKey: .incorrectPassword)
        
        labelCurrentPassword.text = LanguageManager.getText(withKey: .currentPassword)
        inputCurrentPassword.placeholder = LanguageManager.getText(withKey: .currentPassword)
        
        inputConfirmPassword.placeholder = LanguageManager.getText(withKey: .confirmPassword)
        labelConfirmPassword.text = LanguageManager.getText(withKey: .confirmPassword)
        errorConfirmPassword.text = LanguageManager.getText(withKey: .passwordAreNotTheSame)
        
    }
}
