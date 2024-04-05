//
//  FirebaseRepositoryImp.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//

import Foundation
import FirebaseAuth
import FirebaseCore

class FirebaseRepositoryImp : FirebaseRepository {
    func userLoginEmail(email: String, password: String) -> User {
        var user = User()
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            user.email = authResult?.user.email
            user.idUser = authResult?.user.uid
        }
        user.listIndexCategory = [Constant.Key.KEY_TYPE_TUOI_TRE: Array(0...17),
                                  Constant.Key.KEY_TYPE_VN_EXPRESS : Array(0...21)]
        return user
    }
    func createUser(with email : String, with password : String) -> User? {
        var user : User? = User()
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if(error == nil) {
                user = nil
                return
            }
            else {
                user!.email = authResult?.user.email
                user!.idUser = authResult?.user.uid
            }
        }
        user?.listIndexCategory = [Constant.Key.KEY_TYPE_TUOI_TRE: Array(0...17),
                                   Constant.Key.KEY_TYPE_VN_EXPRESS : Array(0...21)]
        return user
    }
    
}
