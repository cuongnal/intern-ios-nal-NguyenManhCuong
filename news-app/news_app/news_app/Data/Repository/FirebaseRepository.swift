//
//  FirebaseRepository.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//

import Foundation
protocol FirebaseRepository {
    func userLoginEmail(email : String, password : String) -> ()
}
