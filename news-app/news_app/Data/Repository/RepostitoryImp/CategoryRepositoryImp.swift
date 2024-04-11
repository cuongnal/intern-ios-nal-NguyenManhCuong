//
//  LocalCategoryRepositoryImp.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class CategoryRepositoryImp : CategoriesRepository {
    
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
}
