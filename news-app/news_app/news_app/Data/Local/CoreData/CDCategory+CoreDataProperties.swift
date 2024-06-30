//
//  CDCategory+CoreDataProperties.swift
//  news_app
//
//  Created by Manhcuong on 02/05/2024.
//
//

import Foundation
import CoreData


extension CDCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCategory> {
        return NSFetchRequest<CDCategory>(entityName: "CDCategory")
    }

    @NSManaged public var idCate: UUID?
    @NSManaged public var indexCategory: Int64
    @NSManaged public var title: String?
    @NSManaged public var typeSource: String?
    @NSManaged public var url: String?
    @NSManaged public var categoriesNews: NSSet?

}

// MARK: Generated accessors for categoriesNews
extension CDCategory {

    @objc(addCategoriesNewsObject:)
    @NSManaged public func addToCategoriesNews(_ value: CDNews)

    @objc(removeCategoriesNewsObject:)
    @NSManaged public func removeFromCategoriesNews(_ value: CDNews)

    @objc(addCategoriesNews:)
    @NSManaged public func addToCategoriesNews(_ values: NSSet)

    @objc(removeCategoriesNews:)
    @NSManaged public func removeFromCategoriesNews(_ values: NSSet)

}

extension CDCategory : Identifiable {

}
