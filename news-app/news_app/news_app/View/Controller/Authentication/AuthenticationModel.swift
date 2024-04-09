//
//  AuthenticationModel.swift
//  news_app
//
//  Created by hiepnv1 on 27/03/2024.
//

import Foundation
import FirebaseAuth
class AuthenticationModel  : BaseModel {
    let categoryRepository = CategoryRepositoryImp()
    let userRepository = UsersRepositoryImp()
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
    
    func signInEmail(email : String, password : String, callBack : @escaping (() -> Void)) {
        self.delegate?.startLoading()
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            if error != nil {
                return
            }
            let user : User? = self?.userRepository.getUserDetail(idUser: (authResult?.user.uid)!)
            if let user = user {
                UserDefaults.setUser(user: user)
                callBack()
                self?.delegate?.cancelLoading()
            }
            else {
                var user = User()
                user.email = authResult?.user.email
                user.idUser = authResult?.user.uid
                user.listIndexCategory = UserDefaults.standard.setIndexCategoryDefault()
                let userInsert : User? = self?.userRepository.insertUser(user: user)
                UserDefaults.setUser(user: userInsert!)
                callBack()
                self?.delegate?.cancelLoading()
            }
        }
    }
//    private func getCategory(result : @escaping (([Category]) -> Void)) {
//        excuteTask(task: { [weak self] in
//            self?.categoryRepository.getCategoriesByTypeSource(withTypeSource:.vnExpress, withUser: UserDefaults.getUser()!)
//        }, complete: { (arr) in
//            result(arr!)
//        })
//    }
    
    func signUpEmail(email : String, password : String, callBack : @escaping (() -> Void)) {
        Auth.auth().sig
    }
    func getAllNews() {
//        excuteNetwork(task: { [weak self] in
//            let remoteArrNews  : [News]? = self?.remoteGetAllNewsUseCase.getAllNews()
//            let localArrNews : [CDNews]? = self?.localGetAllNewsUseCase.getAllNews()
//            if let remoteArrNews = remoteArrNews, let localArrNews = localArrNews {
//               return self?.insertNewsUseCase.insertAllNews(remoteArrNews: remoteArrNews, localArrNews: localArrNews)
//            } else {
//                return false
//            }
//        }, complete: {(isInsert) in
//            
//        })
    }
}

enum HiddenView {
    case signUp, signIn
}
