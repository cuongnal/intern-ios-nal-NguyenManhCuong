//
//  PickLanguageViewController.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation
import UIKit

class PickLanguageViewController : BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var btnSelected: UIButton!
    @IBOutlet weak var btnCancle: UIButton!
    @IBOutlet weak var viewParent: UIView!
    @IBOutlet weak var viewPickerLanguage: UIPickerView!
    var data : [PickerLanguage] = [.vietNamese, .english]
    var callBackChangeLanguage : ((PickerLanguage) -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPickerLanguage.dataSource = self
        viewPickerLanguage.delegate = self
        setUpLanguage()
        
        let typeLanguage = UserDefaults.standard.getValue(swiftClass: LanguageManager.TypeLanguage.self, forKey: Constant.Key.KEY_LANGUAGE_APP) ?? LanguageManager.TypeLanguage.english
        
        if typeLanguage == .vietnamese {
            viewPickerLanguage.selectRow(0, inComponent: 0, animated: true)
        }
        else {
            viewPickerLanguage.selectRow(1, inComponent: 0, animated: true)
        }
        
    }
    override func setUpLanguage() {
        btnCancle.setTitle(LanguageManager.getText(withKey: KeyText.cancel), for: .normal)
        btnSelected.setTitle(LanguageManager.getText(withKey: KeyText.choose), for: .normal)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewParent.layer.cornerRadius = 15
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
   
    @IBAction func cancleViewController(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func chooseLanguage(_ sender: Any) {
        callBackChangeLanguage?(data[viewPickerLanguage.selectedRow(inComponent: 0)])
        dismiss(animated: true)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row].rawValue
    }
    
}
enum PickerLanguage : String{
    case vietNamese = "Tiếng Việt"
    case english = "English"
}
