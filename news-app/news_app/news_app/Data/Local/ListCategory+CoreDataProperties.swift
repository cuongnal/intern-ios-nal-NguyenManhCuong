//
//  ListCategory+CoreDataProperties.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//
//

import Foundation
import CoreData


extension ListCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListCategory> {
        return NSFetchRequest<ListCategory>(entityName: "ListCategory")
    }

    @NSManaged public var idListCategory: Int64
    @NSManaged public var categories: NSSet?
    @NSManaged public var users: Users?

}

// MARK: Generated accessors for categories
extension ListCategory {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: Categories)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: Categories)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}

extension ListCategory : Identifiable {

}
