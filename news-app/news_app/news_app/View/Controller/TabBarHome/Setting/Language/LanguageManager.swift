//
//  LanguageManager.swift
//  news_app
//
//  Created by Manhcuong on 23/04/2024.
//

import Foundation

class LanguageManager  {
    class func changeLanguage(withTypeLanguage type : TypeLanguage = .vietnamese) {
        let path = Bundle.main.path(forResource: type.rawValue, ofType: "lproj")
        print(path)
        guard path != nil else {return}
        UserDefaults.standard.setValue(withAnyObject: type, key: Constant.Key.KEY_LANGUAGE_APP)
        UserDefaults.standard.synchronize()
    }
    class func setText(withKey key : String) -> String {

        guard let type = UserDefaults.standard.getValue(swiftClass: TypeLanguage.self, forKey: Constant.Key.KEY_LANGUAGE_APP),
            let path = Bundle.main.path(forResource: type.rawValue, ofType: "lproj"),
        let bundle = Bundle(path: path) else {
            print("Khong tao dc")
            return ""
        }
        Bundle.main.localization = "vi"
        return NSLocalizedString(key , comment: "")
    }
    class func setDefaultLanguage() {
        changeLanguage()
    }
    enum TypeLanguage : String, Codable {
        case vietnamese = "vi"
        case english = "en"
    }
}
