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
            return Constant.Error.ERROR_PASSWORD
        case .emailAlreadyInUse :
            return Constant.Error.EMAIL_ALREADY_IN_USE
        case .invalidEmail :
            return Constant.Error.INVALID_EMAIL
        case .userNotFound :
            return Constant.Error.ERROR_EMAIL
        default :
            return Constant.Error.NIL + (error as NSError).description
        }
    }
}

