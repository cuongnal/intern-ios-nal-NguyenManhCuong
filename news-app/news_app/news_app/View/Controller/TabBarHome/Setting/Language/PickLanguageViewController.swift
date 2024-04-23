//
//  PickLanguageViewController.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation
import UIKit

class PickLanguageViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var viewParent: UIView!
    @IBOutlet weak var viewPickerLanguage: UIPickerView!
    var data : [PickerLanguage] = [.vietNamese, .english]
    var callBack : ((PickerLanguage) -> ())!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPickerLanguage.dataSource = self
        viewPickerLanguage.delegate = self
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
        callBack(data[viewPickerLanguage.selectedRow(inComponent: 0)])
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
