//
//  LocalCategoryRepositoryImp.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class CategoryRepositoryImp : CategoryRepository {
    
    func getCategoriesByTypeSource(withTypeSource type : TypeSource, withUser user : User) -> [Category] {
        do {
            
            let arr =  try CDCategory.getCDCategoryWithTypeSource(withTypeSource: type)
            return DataMapper.MapCDCategoryToEntity(withTypeSource: type, withUser : user, cdCategory: arr)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
        
    }
    func getAll() -> [Category] {
        do {
            let arr = try CDCategory.getAll()
            return DataMapper.MapCDCategoryToEntity(withCDCategory: arr)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
    }
    func getCategoryWithUUID(withUUIDs uuids : [UUID]) -> [Category] {
        do {
            let arr = try CDCategory.getCategory(withUUIDs: uuids)
            return DataMapper.MapCDCategoryToEntity(withCDCategory: arr)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
    }
}
