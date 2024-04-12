
//
//  LocalUsersRepositoryImp.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class UsersRepositoryImp : UsersRepository {
    func getAllUser() {
        return
    }
    
    func getUserDetail(idUser: String) -> User? {
        do {
            let user =  try CDUser.fetchUserById(idUser: idUser)
            guard let user = user else {
                return nil
            }
            return DataMapper.MapCDUsertoEntity(withCDUser: user)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
        }
        return nil
    }
    func insertUser(user : User) -> User? {
        do {
            let cdUser = try CDUser.insertUser(withUser: user)
            if let cdUser = cdUser {
                return DataMapper.MapCDUsertoEntity(withCDUser: cdUser)
            }
            return nil
        }
        catch let err{
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return nil
        }
    }
    
}
