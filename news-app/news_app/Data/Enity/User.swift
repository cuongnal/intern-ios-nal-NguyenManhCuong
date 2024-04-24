//
//  UserEntity.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

public struct User : Codable {
    var idUser : String?
    var email : String?
    var listIndexCategory : [String: [Int]]?
    var hiddenCategories : Bool = false
}
