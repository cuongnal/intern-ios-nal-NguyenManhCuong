//
//  AuthenticationModel.swift
//  news_app
//
//  Created by hiepnv1 on 27/03/2024.
//

import Foundation
import FirebaseAuth
class AuthenticationModel  : BaseModel {
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
        // return true
        // return true để auto cho đăng nhập
        return checkErrorEmail(email: email) && checkErrorPassword(password: password)
    }
    
    func loggingEmail(email : String, password : String) {
        excuteNetwork(task: {
            
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
                guard let error = error else {
                    return authDataResult
                }
                return error
            }
          
        }, complete: {_ in
            
        })
        
    }
}

enum HiddenView {
    case signUp, signIn
}
