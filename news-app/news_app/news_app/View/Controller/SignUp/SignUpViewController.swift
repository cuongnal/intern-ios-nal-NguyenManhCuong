//
//  ViewController.swift
//  news_app
//
//  Created by hiepnv1 on 08/03/2024.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var inputPassword: CustomTextField!
    @IBOutlet weak var inputEmail: CustomTextField!
    
    @IBOutlet weak var btnSignInWithEmail: UIImageView!
    @IBOutlet weak var btnSignUp: ButtonLogin!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputPassword.enablePasswordToggle()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        btnSignUp.addTarget(self, action: #selector(onTouchBtnSignUpButton), for: .touchUpInside)
        btnSignInWithEmail.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchBtnSignInWithEmail)))
    }
    
    @objc private func onTouchBtnSignUpButton() {
        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "home") else {return}
        self.removeFromParent()
        self.view.removeFromSuperview()
        
        guard let window = UIApplication.shared.windows.first else { return }
        window.rootViewController = homeVC
    }
    
    @objc private func onTouchBtnSignInWithEmail() {
        guard let signIn = storyboard?.instantiateViewController(withIdentifier: "signIn") else {return}
        
        self.addChild(signIn)
        signIn.didMove(toParent: self)
        self.view.addSubview(signIn.view)
        signIn.view.didMoveToSuperview()
    }
    @IBAction func emailAndPasswordChanged(_ sender: Any) {
        
        labelEmail.alpha = inputEmail.text?.isEmpty == true ? 0 : 1
        labelPassword.alpha = inputPassword.text?.isEmpty == true ? 0 : 1
        
        if inputEmail?.text?.isEmpty == false &&
            inputPassword?.text?.isEmpty == false {
            btnSignUp.backgroundColor = UIColor.black
        }
        else {
            btnSignUp.backgroundColor = Constant.COLOR_SIGN_UP_GRAY
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

