//
//  ForgotPasswordViewController.swift
//  news_app
//
//  Created by hiepnv1 on 25/03/2024.
//

import Foundation
import UIKit

class ForgotPasswordViewController : UIViewController{
    
    @IBOutlet weak var btnBackViewController: UIImageView!
    
    @IBOutlet weak var inputEmail: CustomTextField!
    
    @IBOutlet weak var labelInputEmail: UILabel!
    @IBOutlet weak var btnReset: ButtonLogin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
