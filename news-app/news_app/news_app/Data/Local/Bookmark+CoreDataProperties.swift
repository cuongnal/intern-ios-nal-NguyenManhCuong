//
//  Bookmark+CoreDataProperties.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//
//

import Foundation
import CoreData


extension Bookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmark> {
        return NSFetchRequest<Bookmark>(entityName: "Bookmark")
    }

    @NSManaged public var idBookmark: Int64
    @NSManaged public var news: NSSet?
    @NSManaged public var users: Users?

}

// MARK: Generated accessors for news
extension Bookmark {

    @objc(addNewsObject:)
    @NSManaged public func addToNews(_ value: News)

    @objc(removeNewsObject:)
    @NSManaged public func removeFromNews(_ value: News)

    @objc(addNews:)
    @NSManaged public func addToNews(_ values: NSSet)

    @objc(removeNews:)
    @NSManaged public func removeFromNews(_ values: NSSet)

}

extension Bookmark : Identifiable {

}
