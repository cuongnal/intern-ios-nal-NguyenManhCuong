//
//  CDCategoryExtension.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation

extension CDCategory {
    @nonobjc public class func getCDCategory(category : Category) throws -> CDCategory? {
        var a = CDCategory.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.idCate), category.id as CVarArg)
        return try AppDelegate.context.fetch(a).first ?? nil
    }
}
