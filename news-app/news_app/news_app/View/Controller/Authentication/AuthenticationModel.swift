//
//  AuthenticationModel.swift
//  news_app
//
//  Created by hiepnv1 on 27/03/2024.
//

import Foundation
import FirebaseAuth
class AuthenticationModel  : BaseModel {
    let categoryRepository : CategoryRepository
    let userRepository : UsersRepository
    
    
    init(categoryRepository: CategoryRepository, userRepository: UsersRepository) {
        self.categoryRepository = categoryRepository
        self.userRepository = userRepository
    }
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
    
    func isEnableTouchBtnSignUpSignIn(email : String?, password : String?) -> Bool {
        return checkErrorEmail(email: email) && checkErrorPassword(password: password)
    }
    
    func signInEmail(email : String, password : String, callback : @escaping ((Bool, String?) -> Void)) {
        self.delegate?.startLoading()
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            if let error = error {
                callback(false, FirebaseErrorCode.error(withError: error) )
                return
            }
            let user : User? = self?.userRepository.getUserDetail(idUser: (authResult?.user.uid)!)
            if let user = user {
                UserDefaults.setUser(user: user)
                callback(true, nil)
                self?.delegate?.cancelLoading()
            }
            else {
                var user = User()
                user.email = authResult?.user.email
                user.idUser = authResult?.user.uid
                user.listIndexCategory = UserDefaults.standard.setIndexCategoryDefault()
                let userInsert : User? = self?.userRepository.insertUser(user: user)
                UserDefaults.setUser(user: userInsert!)
                callback(true, nil)
                self?.delegate?.cancelLoading()
            }
        }
    }
    
    func signUpEmail(email : String, password : String, callback : @escaping ((Bool, String?) -> Void)) {
        self.delegate?.startLoading()
        Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self](authDataResult,error) in
            if let error = error  {
                callback(false, FirebaseErrorCode.error(withError: error))
                return
            }
            var user = User()
            user.email = authDataResult?.user.email
            user.idUser = authDataResult?.user.uid
            user.listIndexCategory = UserDefaults.standard.setIndexCategoryDefault()
            let userInsert : User? = self?.userRepository.insertUser(user: user)
            UserDefaults.setUser(user: userInsert!)
            callback(true, nil)
            self?.delegate?.cancelLoading()
        })
    }
    func changePassword(withCurrentPassword currentPassword : String, newPassword : String, callback : @escaping ((Bool,String) -> Void) ) {
        self.delegate?.startLoading()
        let user = Auth.auth().currentUser
        let credential : AuthCredential = EmailAuthProvider.credential(withEmail: UserDefaults.getUser()!.email!, password: currentPassword)
        user?.reauthenticate(with: credential) { [weak self] (authResult, err)  in
            if let err = err {
                callback(false,FirebaseErrorCode.error(withError: err))
                self?.delegate?.cancelLoading()
            }
            else {
                Auth.auth().currentUser?.updatePassword(to: newPassword) { [weak self] err in
                    if err == nil {
                        callback(true, LanguageManager.getText(withKey: .successChangePassword))
                        self?.delegate?.cancelLoading()
                    }
                    else {
                        callback(true, LanguageManager.getText(withKey: .errorChangePassword))
                        self?.delegate?.cancelLoading()
                    }
                }
            }
        }
    }
}

enum TypeScreen {
    case signUp, signIn
}
