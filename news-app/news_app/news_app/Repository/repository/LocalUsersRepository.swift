//
//  UsersLocalRepository.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

protocol LocalUsersRepository {
    func getAllUser()
    func getUserDetail(idUser : String) -> CDUser?
}
