//
//  UsersLocalRepository.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

protocol UsersRepository {
    func getAllUser()
    func getUserDetail(idUser : String) -> User?
    func insertUser(user : User) -> User?
    func updateIndexCategories (withCategories arrCategory : [Category], user : User) -> Dictionary<String , Array<Int> >?
    func updateUser(user : User) 
}
