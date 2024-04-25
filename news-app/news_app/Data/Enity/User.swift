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
    var listItemShow : [String : [Int]]? = [TypeSource.vnExpress.rawValue : Array(0...20),
                                                TypeSource.tuoiTre.rawValue : Array(0...17)]
}
