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
        catch let error {
            print(error)
        }
        return nil
    }
    func insertUser(user : User) -> User? {
        do {
            var cdUser = try CDUser.insertUser(withUser: user)
            if let cdUser = cdUser {
                return DataMapper.MapCDUsertoEntity(withCDUser: cdUser)
            }
            return nil
        }
        catch {
            print("Lưu user không thành công")
            return nil
        }
    }
    
}
