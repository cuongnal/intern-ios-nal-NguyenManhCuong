//
//  ViewController.swift
//  news_app
//
//  Created by hiepnv1 on 08/03/2024.
//

import UIKit

class SignUpController: UIViewController {


    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var inputPassword: CustomTextField!
    @IBOutlet weak var inputEmail: CustomTextField!
    
    @IBOutlet weak var btnSignUp: ButtonLogin!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func emailAndPasswordChanged(_ sender: Any) {
        
        labelEmail.alpha = inputEmail.text?.isEmpty == true ? 0 : 1
        labelPassword.alpha = inputPassword.text?.isEmpty == true ? 0 : 1
        
        if inputEmail.text?.isEmpty == false &&
           inputPassword.text?.isEmpty == false {
            btnSignUp.backgroundColor = UIColor.black
        }
        else {
            btnSignUp.backgroundColor = UIColor.gray
        }
    }
}

