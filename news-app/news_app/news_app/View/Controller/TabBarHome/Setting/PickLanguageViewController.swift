//
//  PickLanguageViewController.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation
import UIKit

class PickLanguageViewController : UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var data : [TypeLanguage] = [.vietNamese, .english]
    var callBack : ((TypeLanguage) -> ())!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.dataSource = self
        self.delegate = self
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callBack?(data[row])
        self.isHidden = true

    }
    
}
enum TypeLanguage : String{
    case vietNamese = "Tiếng Việt"
    case english = "English"
}
