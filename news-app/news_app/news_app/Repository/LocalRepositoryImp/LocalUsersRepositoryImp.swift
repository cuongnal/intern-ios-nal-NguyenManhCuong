//
//  LocalUsersRepositoryImp.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class LocalUsersRepositoryImp : LocalUsersRepository {
    func getAllUser() {
        return
    }
    
    func getUserDetail(idUser: String) -> CDUser? {
        do {
            let user =  try AppDelegate.context.fetch(CDUser.fetchUserById(idUser: idUser))
            if user.count != 0 {
                return user[0]
            }
        }
        catch let error {
            print(error)
        }
        return nil
    }
    
    
}
