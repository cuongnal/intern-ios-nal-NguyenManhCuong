//
//  CDNews+CoreDataProperties.swift
//  news_app
//
//  Created by user on 4/11/24.
//
//

import Foundation
import CoreData


extension CDNews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDNews> {
        return NSFetchRequest<CDNews>(entityName: "CDNews")
    }

    @NSManaged public var author: String?
    @NSManaged public var des: String?
    @NSManaged public var idCate: UUID?
    @NSManaged public var idNews: String?
    @NSManaged public var image: String?
    @NSManaged public var link: String?
    @NSManaged public var pubDate: String?
    @NSManaged public var title: String?
    @NSManaged public var categoriesNews: CDCategory?
    @NSManaged public var seenNews: NSSet?
    @NSManaged public var saveBookmark: NSSet?

}

// MARK: Generated accessors for seenNews
extension CDNews {

    @objc(addSeenNewsObject:)
    @NSManaged public func addToSeenNews(_ value: CDUser)

    @objc(removeSeenNewsObject:)
    @NSManaged public func removeFromSeenNews(_ value: CDUser)

    @objc(addSeenNews:)
    @NSManaged public func addToSeenNews(_ values: NSSet)

    @objc(removeSeenNews:)
    @NSManaged public func removeFromSeenNews(_ values: NSSet)

}

// MARK: Generated accessors for saveBookmark
extension CDNews {

    @objc(addSaveBookmarkObject:)
    @NSManaged public func addToSaveBookmark(_ value: CDUser)

    @objc(removeSaveBookmarkObject:)
    @NSManaged public func removeFromSaveBookmark(_ value: CDUser)

    @objc(addSaveBookmark:)
    @NSManaged public func addToSaveBookmark(_ values: NSSet)

    @objc(removeSaveBookmark:)
    @NSManaged public func removeFromSaveBookmark(_ values: NSSet)

}

extension CDNews : Identifiable {

}
