//
//  AuthenticationModel.swift
//  news_app
//
//  Created by hiepnv1 on 27/03/2024.
//

import Foundation
class AuthenticationModel  {
    func checkErrorEmail(email : String?) -> Bool{
        guard email != nil else {
            return false
        }
        return email!.isValidEmail()
    }
    func checkErrorPassword(password : String?) ->Bool {
        guard password != nil else {
            return false
        }
        return password!.count >= 6
    }
    func isTouchBtnSignUpSignIn(email : String?, password : String?) -> Bool {
       return checkErrorEmail(email: email) && checkErrorPassword(password: password)
    }
}

enum HiddenView {
    case signUp, signIn
}
