//
//  Categories+CoreDataProperties.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var idCategory: UUID?
    @NSManaged public var title: String?
    @NSManaged public var typeSource: String?
    @NSManaged public var url: String?
    @NSManaged public var categoriesNews: NSSet?

}

// MARK: Generated accessors for categoriesNews
extension Categories {

    @objc(addCategoriesNewsObject:)
    @NSManaged public func addToCategoriesNews(_ value: News)

    @objc(removeCategoriesNewsObject:)
    @NSManaged public func removeFromCategoriesNews(_ value: News)

    @objc(addCategoriesNews:)
    @NSManaged public func addToCategoriesNews(_ values: NSSet)

    @objc(removeCategoriesNews:)
    @NSManaged public func removeFromCategoriesNews(_ values: NSSet)

}

extension Categories : Identifiable {

}
