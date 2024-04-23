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
        guard let path = path else {return}
        UserDefaults.standard.set(path, forKey: Constant.Key.KEY_LANGUAGE_APP)
        UserDefaults.standard.synchronize()
    }
    class func setText(withKey key : String) -> String {
        
        guard let path = UserDefaults.standard.string(forKey: Constant.Key.KEY_LANGUAGE_APP),
        let bundle = Bundle(path: path) else {
            return ""
        }
        
        return NSLocalizedString(key, bundle:bundle , comment: "")
    }
    enum TypeLanguage : String {
        case vietnamese = "vi"
        case english = "en"
    }
}
