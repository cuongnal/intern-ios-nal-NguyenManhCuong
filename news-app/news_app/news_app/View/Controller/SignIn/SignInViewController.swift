//
//  LoginViewController.swift
//  news_app
//
//  Created by hiepnv1 on 25/03/2024.
//

import Foundation
import UIKit
class SignInController : UIViewController{
    
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var inputPassword: CustomTextField!
    @IBOutlet weak var inputEmail: CustomTextField!
    
    @IBOutlet weak var btnSignIn: ButtonLogin!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputPassword.enablePasswordToggle()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func onTapBtnRegister(_ sender: Any) {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    @IBAction func onTapForgotPassword() {
        guard let signIn = storyboard?.instantiateViewController(withIdentifier: "ForgotPassword") else {return}
        
        self.addChild(signIn)
        signIn.didMove(toParent: self)
        self.view.addSubview(signIn.view)
        signIn.view.didMoveToSuperview()
    }
    
    @IBAction func onTouchBtnSignInButton() {
//        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "home") else {return}
//        self.removeFromParent()
//        self.view.removeFromSuperview()
//
//        guard let window = UIApplication.shared.windows.first else { return }
//        window.rootViewController = homeVC
        guard let tabBar = storyboard?.instantiateViewController(withIdentifier: "tabBarHome") else {return}
        tabBar.modalPresentationStyle = .fullScreen
        self.present(tabBar, animated: true, completion: nil)
    }
    
    @IBAction func emailAndPasswordChanged(_ sender: Any) {
        
        labelEmail.alpha = inputEmail.text?.isEmpty == true ? 0 : 1
        labelPassword.alpha = inputPassword.text?.isEmpty == true ? 0 : 1
        
        if inputEmail.text?.isEmpty == false &&
            inputPassword.text?.isEmpty == false {
            btnSignIn.backgroundColor = UIColor.black
        }
        else {
            btnSignIn.backgroundColor = Constant.COLOR_SIGN_UP_GRAY
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
