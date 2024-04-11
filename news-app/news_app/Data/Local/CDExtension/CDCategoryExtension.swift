//
//  CDCategoryExtension.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation

extension CDCategory {
    @nonobjc public class func getCDCategory(category : Category) throws -> CDCategory? {
        let a = CDCategory.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.idCate), category.idCate as CVarArg)
        return try AppDelegate.context.fetch(a).first ?? nil
    }
    @nonobjc public class func getCDCategory(idCate : UUID) throws -> CDCategory? {
        let a = CDCategory.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.idCate), idCate as CVarArg)
        return try AppDelegate.context.fetch(a).first ?? nil
    }
    @nonobjc public class func getCDCategoryWithTypeSource(withTypeSource type : TypeSource) throws -> [CDCategory] {
        let a = CDCategory.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.typeSource), type.rawValue)
        return try AppDelegate.context.fetch(a)
    }
    @nonobjc public class func getAll() throws -> [CDCategory] {
        let a = CDCategory.fetchRequest()
        return try AppDelegate.context.fetch(a)
    }
}
