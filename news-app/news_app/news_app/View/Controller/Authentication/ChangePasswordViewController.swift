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
        setButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func editingChangeCurrentPassword(_ sender: Any) {
    }
    
    @IBAction func edittingChangeNewPassword(_ sender: Any) {
    }
    
    @IBAction func editingChangeConfirmPassword(_ sender: Any) {
    }
    
    func setButton() {
        let btnLeftFirst = UIBarButtonItem(image: UIImage(named: "ic_back"), style: .plain, target: self, action: #selector(goBack))
        let btnLeftSecond = UIBarButtonItem(title: LanguageManager.getText(withKey: .ACCOUNT), style: .plain, target: nil, action: nil)
        
        btnLeftSecond.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ], for: .normal)
        navigationItem.leftBarButtonItems = [btnLeftFirst,btnLeftSecond]
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
        
    }
}
