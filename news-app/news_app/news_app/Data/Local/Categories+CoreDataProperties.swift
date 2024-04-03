//
//  Categories+CoreDataProperties.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//
//

import Foundation
import CoreData


extension Categories {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }
    
    @NSManaged public var idCategory: Int64
    @NSManaged public var title: String?
    @NSManaged public var typeCategory: String?
    @NSManaged public var url: String?
    @NSManaged public var listCategory: NSSet?
    @NSManaged public var news: NSSet?
    
}

// MARK: Generated accessors for listCategory
extension Categories {
    
    @objc(addListCategoryObject:)
    @NSManaged public func addToListCategory(_ value: ListCategory)
    
    @objc(removeListCategoryObject:)
    @NSManaged public func removeFromListCategory(_ value: ListCategory)
    
    @objc(addListCategory:)
    @NSManaged public func addToListCategory(_ values: NSSet)
    
    @objc(removeListCategory:)
    @NSManaged public func removeFromListCategory(_ values: NSSet)
    static func insertDefaultData() {
        let categories = NSEntityDescription.insertNewObject(forEntityName: "Categories", into: AppDelegate.dataBaseContext) as! Categories
        let vnExpress = Constant.CATEGORY_VN_EXPRESS
        for item in vnExpress {
            var object = Categories()
            object.idCategory = Int64(item.id)
            object.url = item.url
            object.title = item.title
        }
    }
}

// MARK: Generated accessors for news
extension Categories {
    
    @objc(addNewsObject:)
    @NSManaged public func addToNews(_ value: News)
    
    @objc(removeNewsObject:)
    @NSManaged public func removeFromNews(_ value: News)
    
    @objc(addNews:)
    @NSManaged public func addToNews(_ values: NSSet)
    
    @objc(removeNews:)
    @NSManaged public func removeFromNews(_ values: NSSet)
    
}

extension Categories : Identifiable {
    
}
