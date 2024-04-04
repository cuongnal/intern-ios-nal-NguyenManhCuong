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
    func userLoginEmail(email: String, password: String) -> () {
        let a = FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password)
        print(a)
    }
    
    
}
