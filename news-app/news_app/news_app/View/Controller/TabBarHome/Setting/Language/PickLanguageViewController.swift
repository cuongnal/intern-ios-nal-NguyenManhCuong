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
    var callBackChangeLanguage : ((PickerLanguage) -> ())!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPickerLanguage.dataSource = self
        viewPickerLanguage.delegate = self
        setUpLanguage()
    }
    override func setUpLanguage() {
        btnCancle.setTitle(LanguageManager.getText(withKey: KeyText.CANCEL), for: .normal)
        btnSelected.setTitle(LanguageManager.getText(withKey: KeyText.CHOOSE), for: .normal)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewParent.layer.cornerRadius = 30

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
   
    @IBAction func cancleViewController(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func chooseLanguage(_ sender: Any) {
        callBackChangeLanguage(data[viewPickerLanguage.selectedRow(inComponent: 0)])
        dismiss(animated: true)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return data[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
}
enum PickerLanguage : String{
    case vietNamese = "Tiếng Việt"
    case english = "English"
}