//
//  CDCategoryExtension.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation

extension CDCategory {
    public class func getCDCategory(category : Category) throws -> CDCategory? {
        let a = CDCategory.fetchRequest()
        guard let idCate = category.idCate as? CVarArg else {return nil}
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.idCate), idCate)
        return try AppDelegate.context.fetch(a).first ?? nil
    }
    public class func getCDCategory(idCate : UUID) throws -> CDCategory? {
        var category: CDCategory?
        try AppDelegate.context.performAndWait {
            let a = CDCategory.fetchRequest()
            a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.idCate), idCate as CVarArg)
            category = try AppDelegate.context.fetch(a).first ?? nil
        }
        return category
    }
    public class func getCDCategoryWithTypeSource(withTypeSource type : TypeSource) throws -> [CDCategory] {
        let a = CDCategory.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.typeSource), type.rawValue)
        return try AppDelegate.context.fetch(a)
    }
    public class func getAll() throws -> [CDCategory] {
        let a = CDCategory.fetchRequest()
        return try AppDelegate.context.fetch(a)
    }
    public class func getCategory(withUUIDs uuids : [UUID]) throws -> [CDCategory] {
        let a = CDCategory.fetchRequest()
        a.predicate = NSPredicate(format: "idCate IN %@", uuids)
        return try AppDelegate.context.fetch(a)
    }
}