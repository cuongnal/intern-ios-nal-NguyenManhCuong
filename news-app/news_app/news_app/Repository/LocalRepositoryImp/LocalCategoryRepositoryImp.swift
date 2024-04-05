//
//  LocalCategoryRepositoryImp.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class LocalCategoryRepositoryImp : LocalCategoriesRepository {
    
    func getCategoriesByTypeSource() -> [CDCategory] {
        do {
            let arr =  try AppDelegate.context.fetch(CDCategory.fetchRequest())
            return arr
        }
        catch {
            return []
        }

    }
}
