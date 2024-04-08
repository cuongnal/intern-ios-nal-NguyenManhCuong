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
    let localCategoryUseCase = GetCategoryByUserUseCase()
    
    let remoteGetAllNewsUseCase = RemoteGetAllNewsUseCase()
    let localGetAllNewsUseCase = LocalGetAllNewsUseCase()
    let insertNewsUseCase = InsertNewsUseCase()
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
        excuteNetwork(
            blockUI: true,
            task: { [weak self] in
                self?.firebaseRepository.userLoginEmail(email: email, password: password)
            },
            complete: {_ in callBack()}
        )
    }
    private func getCategory(user : User , result : @escaping (([Category]) -> Void)) {
        excuteTask(task: { [weak self] in
            self?.localCategoryUseCase.run(param: Param(data: nil, idUser: user.idUser!, keyTypeSourceConstant: Constant.Key.KEY_TYPE_VN_EXPRESS))
        }, complete: { (arr) in
            result(arr!)
        })
    }
    
    func signUpEmail(email : String, password : String, callBack : @escaping (() -> Void)) {
        excuteNetwork(
            blockUI: true,
            task: { [weak self] in
                self?.firebaseRepository.createUser(withEmail: email, withPassword: password)
            }, 
            complete: { (user) in
                if user == nil {return}
                callBack()
            })
    }
    func getAllNews() {
        excuteNetwork(task: { [weak self] in
            let remoteArrNews  : [News]? = self?.remoteGetAllNewsUseCase.getAllNews()
            let localArrNews : [CDNews]? = self?.localGetAllNewsUseCase.getAllNews()
            if let remoteArrNews = remoteArrNews, let localArrNews = localArrNews {
               return self?.insertNewsUseCase.insertAllNews(remoteArrNews: remoteArrNews, localArrNews: localArrNews)
            } else {
                return false
            }
        }, complete: {(isInsert) in
            
        })
    }
}

enum HiddenView {
    case signUp, signIn
}
