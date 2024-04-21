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
    
    func isTouchBtnSignUpSignIn(email : String?, password : String?) -> Bool {
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
    //    private func getCategory(result : @escaping (([Category]) -> Void)) {
    //        excuteTask(task: { [weak self] in
    //            self?.categoryRepository.getCategoriesByTypeSource(withTypeSource:.vnExpress, withUser: UserDefaults.getUser()!)
    //        }, complete: { (arr) in
    //            result(arr!)
    //        })
    //    }
    
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

enum TypeScreen {
    case signUp, signIn
}
