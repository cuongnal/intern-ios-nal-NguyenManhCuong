//
//  FirebaseErrorCode.swift
//  news_app
//
//  Created by user on 4/10/24.
//

import Foundation
import FirebaseAuth

public class FirebaseErrorCode {
    public class func error(withError error : Error)  -> String{
        let a  = AuthErrorCode(_nsError: error as NSError).code
        
        switch (a) {
            case .wrongPassword :
                return LanguageManager.getText(withKey: .errorPassword)
            case .emailAlreadyInUse :
                return LanguageManager.getText(withKey: .emailAlreadyInUse)
            case .invalidEmail :
                return LanguageManager.getText(withKey: .invalidEmail)
            case .userNotFound :
                return LanguageManager.getText(withKey: .invalidEmail)
            default :
                return LanguageManager.getText(withKey: .errorNil) + (error as NSError).description
        }
    }
}

