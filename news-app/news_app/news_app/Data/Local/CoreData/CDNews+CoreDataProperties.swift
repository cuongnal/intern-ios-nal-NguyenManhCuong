//
//  CDNews+CoreDataProperties.swift
//  news_app
//
//  Created by Manhcuong on 02/05/2024.
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
    @NSManaged public var saveBookmark: NSOrderedSet?
    @NSManaged public var sentNews: NSOrderedSet?

}

// MARK: Generated accessors for saveBookmark
extension CDNews {

    @objc(insertObject:inSaveBookmarkAtIndex:)
    @NSManaged public func insertIntoSaveBookmark(_ value: CDUser, at idx: Int)

    @objc(removeObjectFromSaveBookmarkAtIndex:)
    @NSManaged public func removeFromSaveBookmark(at idx: Int)

    @objc(insertSaveBookmark:atIndexes:)
    @NSManaged public func insertIntoSaveBookmark(_ values: [CDUser], at indexes: NSIndexSet)

    @objc(removeSaveBookmarkAtIndexes:)
    @NSManaged public func removeFromSaveBookmark(at indexes: NSIndexSet)

    @objc(replaceObjectInSaveBookmarkAtIndex:withObject:)
    @NSManaged public func replaceSaveBookmark(at idx: Int, with value: CDUser)

    @objc(replaceSaveBookmarkAtIndexes:withSaveBookmark:)
    @NSManaged public func replaceSaveBookmark(at indexes: NSIndexSet, with values: [CDUser])

    @objc(addSaveBookmarkObject:)
    @NSManaged public func addToSaveBookmark(_ value: CDUser)

    @objc(removeSaveBookmarkObject:)
    @NSManaged public func removeFromSaveBookmark(_ value: CDUser)

    @objc(addSaveBookmark:)
    @NSManaged public func addToSaveBookmark(_ values: NSOrderedSet)

    @objc(removeSaveBookmark:)
    @NSManaged public func removeFromSaveBookmark(_ values: NSOrderedSet)

}

// MARK: Generated accessors for sentNews
extension CDNews {

    @objc(insertObject:inSentNewsAtIndex:)
    @NSManaged public func insertIntoSentNews(_ value: CDUser, at idx: Int)

    @objc(removeObjectFromSentNewsAtIndex:)
    @NSManaged public func removeFromSentNews(at idx: Int)

    @objc(insertSentNews:atIndexes:)
    @NSManaged public func insertIntoSentNews(_ values: [CDUser], at indexes: NSIndexSet)

    @objc(removeSentNewsAtIndexes:)
    @NSManaged public func removeFromSentNews(at indexes: NSIndexSet)

    @objc(replaceObjectInSentNewsAtIndex:withObject:)
    @NSManaged public func replaceSentNews(at idx: Int, with value: CDUser)

    @objc(replaceSentNewsAtIndexes:withSentNews:)
    @NSManaged public func replaceSentNews(at indexes: NSIndexSet, with values: [CDUser])

    @objc(addSentNewsObject:)
    @NSManaged public func addToSentNews(_ value: CDUser)

    @objc(removeSentNewsObject:)
    @NSManaged public func removeFromSentNews(_ value: CDUser)

    @objc(addSentNews:)
    @NSManaged public func addToSentNews(_ values: NSOrderedSet)

    @objc(removeSentNews:)
    @NSManaged public func removeFromSentNews(_ values: NSOrderedSet)

}

extension CDNews : Identifiable {

}
