//
//  LocalCategoriesRepository.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

protocol CategoriesRepository {
    func getCategoriesByTypeSource(withTypeSource type : TypeSource, withUser user : User) -> [Category]
    
    func getAll() -> [Category]
}
