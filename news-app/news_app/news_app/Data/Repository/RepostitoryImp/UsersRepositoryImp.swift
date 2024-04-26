
//
//  LocalUsersRepositoryImp.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class UsersRepositoryImp : UsersRepository {
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
    func updateIndexCategories (withCategories arrCategory : [Category], user : User) -> Dictionary<String , Array<Int> >?{
        do {
            let dictionaryIndex = user.listIndexCategory
            var arrIndexNew : [Int] = []
            
            arrCategory.forEach({
                guard let index = $0.index else {return}
                arrIndexNew.append(index)
            })
            
            
            guard let typeSource = arrCategory.first?.typeSource, var dictionaryIndex = dictionaryIndex
            else {
                return user.listIndexCategory
            }
            
            for itemOld in dictionaryIndex[typeSource]! {
                if !arrIndexNew.contains(itemOld) {
                    arrIndexNew.append(itemOld)
                }
            }
            
            
            dictionaryIndex[typeSource] = arrIndexNew
            try CDUser.updateUser(withDictionaryIndex: dictionaryIndex, with: user)
            
            return dictionaryIndex
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return user.listIndexCategory
        }
    }
    func updateUser(user: User) {
        do {
            try CDUser.updateUser(user: user)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
        }
    }
    
    
}
