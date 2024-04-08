//
//  ViewController.swift
//  news_app
//
//  Created by hiepnv1 on 08/03/2024.
//

import UIKit

class SignUpSignInViewController: BaseViewController {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var policyView: UIView!
    @IBOutlet weak var btnPolicy : UIButton!
    @IBOutlet weak var inputPassword: CustomTextField!
    @IBOutlet weak var inputEmail: CustomTextField!
    
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var registerView: UIStackView!
    @IBOutlet weak var btnSignInWithEmail: UIButton!
    @IBOutlet weak var btnSignUpAndSignIn: ButtonLogin!
    
    @IBOutlet weak var labelIncorrectPassword: UILabel!
    @IBOutlet weak var labelIncorrectEmail: UILabel!
    var flagSign : typeSignUpIn = .signIn
    
    let authenModel = AuthenticationModel()
    var flagCheckSignInSignUp = HiddenView.signUp
    override func viewDidLoad() {
        super.viewDidLoad()
        authenModel.delegate = self
        inputPassword.enablePasswordToggle()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        hiddenView()
    }
    
    @IBAction func onTouchSignUpAndSignIn(_ sender: Any) {
        var tabBar = storyboard?.instantiateViewController(withIdentifier: "TabBarHome") as! TabBarController
        
        authenModel.signInEmail(email: inputEmail.text!, password: inputPassword.text!, callBack: { 
            self.navigationController?.pushViewController(tabBar, animated: true)
        })
    }
    @IBAction func onTouchBtnSignInWithEmail() {
        flagCheckSignInSignUp = .signIn
        UIView.transition(with: self.view.superview!, duration: 0.3, options:
                .transitionFlipFromLeft, animations: {self.hiddenView()}, completion: nil)
        flagSign = .signIn
    }
    @IBAction func onTouchRegisterButton(_ sender: Any) {
        flagCheckSignInSignUp = .signUp
        UIView.transition(with: self.view.superview!, duration: 0.2, options:
                .transitionFlipFromLeft, animations: {self.hiddenView()}, completion: nil)
        flagSign = .signUp
    }
    
    @IBAction func passwordEditingChanged(_ sender: Any) {
        labelPassword.alpha = inputPassword.text?.isEmpty == true ? 0 : 1
        labelIncorrectPassword.alpha = authenModel.checkErrorPassword(password: inputPassword.text) ? 0 : 1
        guard authenModel.isTouchBtnSignUpSignIn(email: inputEmail?.text, password: inputPassword?.text) == true else{
            btnSignUpAndSignIn.setColorButton(flag: false)
            return
        }
        btnSignUpAndSignIn.setColorButton(flag: true)
    }
    @IBAction func emailEditingChanged(_ sender : Any) {
        labelEmail.alpha = inputEmail.text?.isEmpty == true ? 0 : 1
        labelIncorrectEmail.alpha = authenModel.checkErrorEmail(email: inputEmail.text) ? 0 : 1
        guard authenModel.isTouchBtnSignUpSignIn(email: inputEmail?.text, password: inputPassword?.text) == true else{
            btnSignUpAndSignIn.setColorButton(flag: false)
            return
        }
        btnSignUpAndSignIn.setColorButton(flag: true)
    }

    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @IBAction func onTouchPolicy(_ sender: Any) {
        
    }
    func hiddenView () {
        if(flagCheckSignInSignUp == .signUp) {
            btnSignInWithEmail.isHidden = false
            policyView.isHidden = false
            btnPolicy.isHidden = false
            registerView.isHidden = true
            btnForgotPassword.alpha = 0
            btnSignInWithEmail.isHidden = false
            btnSignUpAndSignIn.setTitle("Sign up", for: .normal)
        }
        else {
            btnSignInWithEmail.isHidden = true
            policyView.isHidden = true
            btnPolicy.isHidden = true
            registerView.isHidden = false
            btnForgotPassword.alpha = 1
            btnSignInWithEmail.isHidden = true
            btnSignUpAndSignIn.setTitle("Sign In", for: .normal)
        }
    }
}
enum typeSignUpIn {
    case signIn, signUp
}
