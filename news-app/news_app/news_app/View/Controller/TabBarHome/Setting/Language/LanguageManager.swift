//
//  LanguageManager.swift
//  news_app
//
//  Created by Manhcuong on 23/04/2024.
//

import Foundation

class LanguageManager  {
    class func changeLanguage(withTypeLanguage type : TypeLanguage = .vietnamese) {
        UserDefaults.standard.setValue(withAnyObject: type, key: Constant.Key.KEY_LANGUAGE_APP)
        UserDefaults.standard.synchronize()
        NotificationCenter.default
            .post(name: Constant.NSNoti.CHANGE_LANGUAGE,
                  object: nil)
    }
    class func getText(withKey key : KeyText) -> String {
        let typeLanguage = UserDefaults.standard.getValue(swiftClass: TypeLanguage.self, forKey: Constant.Key.KEY_LANGUAGE_APP) ?? TypeLanguage.english
        let path = Bundle.main.path(forResource: typeLanguage.rawValue, ofType: "lproj")
        
        guard let bundle = Bundle(path: path!) else {return ""}
        return bundle.localizedString(forKey: key.rawValue, value: nil, table: nil)
    }
    class func getText(withString string : String) -> String {
        let typeLanguage = UserDefaults.standard.getValue(swiftClass: TypeLanguage.self, forKey: Constant.Key.KEY_LANGUAGE_APP) ?? TypeLanguage.english
        let path = Bundle.main.path(forResource: typeLanguage.rawValue, ofType: "lproj")
        
        guard let bundle = Bundle(path: path!) else {return ""}
        return bundle.localizedString(forKey: string, value: nil, table: nil)
    }
//    class func setText(withKey key : KeyText) -> String {
//
//        UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
//        UserDefaults.standard.synchronize()
//
//        return NSLocalizedString(key.rawValue, comment: "")
//    }
    
    class func setDefaultLanguage() {
        changeLanguage()
    }
    enum TypeLanguage : String, Codable {
        case vietnamese = "vi"
        case english = "en"
    }
}
