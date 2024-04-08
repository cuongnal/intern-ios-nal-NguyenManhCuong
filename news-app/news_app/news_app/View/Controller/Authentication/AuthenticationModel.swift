//
//  AuthenticationModel.swift
//  news_app
//
//  Created by hiepnv1 on 27/03/2024.
//

import Foundation
import FirebaseAuth
class AuthenticationModel  : BaseModel {
    let firebaseRepository = FirebaseRepositoryImp()
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
    
    func signInEmail(email : String, password : String, callBack : @escaping (() -> ())) {
        excuteNetwork(blockUI: true,
                   task: { [self] in
            firebaseRepository.userLoginEmail(email: email, password: password)
        }, complete: {_ in 
            callBack()
        })
    }
    func signUpEmail(email : String, password : String) {
        
    }
}

enum HiddenView {
    case signUp, signIn
}
