//
//  LocalCategoriesRepository.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

public protocol CategoryRepository {
    func getCategoriesByTypeSource(withTypeSource type : TypeSource, withUser user : User) -> [Category]
    
    func getAll() -> [Category]
    
    func getCategoryWithUUID(withUUIDs uuids : [UUID]) -> [Category]
}
