//
//  CDNews+CoreDataProperties.swift
//  news_app
//
//  Created by Manhcuong on 19/04/2024.
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
    @NSManaged public var saveBookmark: NSSet?
    @NSManaged public var sentNews: NSSet?

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

// MARK: Generated accessors for sentNews
extension CDNews {

    @objc(addSentNewsObject:)
    @NSManaged public func addToSentNews(_ value: CDUser)

    @objc(removeSentNewsObject:)
    @NSManaged public func removeFromSentNews(_ value: CDUser)

    @objc(addSentNews:)
    @NSManaged public func addToSentNews(_ values: NSSet)

    @objc(removeSentNews:)
    @NSManaged public func removeFromSentNews(_ values: NSSet)

}

extension CDNews : Identifiable {

}
