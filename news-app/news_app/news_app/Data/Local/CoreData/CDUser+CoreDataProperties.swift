//
//  CDUser+CoreDataProperties.swift
//  news_app
//
//  Created by Manhcuong on 02/05/2024.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var email: String?
    @NSManaged public var idUser: String?
    @NSManaged public var listIndexCategory: Dictionary<String , Array<Int> >?
    @NSManaged public var listItemShow: Dictionary<String , Array<Int> >?
    @NSManaged public var saveBookmark: NSOrderedSet?
    @NSManaged public var sentNews: NSOrderedSet?

}

// MARK: Generated accessors for saveBookmark
extension CDUser {

    @objc(insertObject:inSaveBookmarkAtIndex:)
    @NSManaged public func insertIntoSaveBookmark(_ value: CDNews, at idx: Int)

    @objc(removeObjectFromSaveBookmarkAtIndex:)
    @NSManaged public func removeFromSaveBookmark(at idx: Int)

    @objc(insertSaveBookmark:atIndexes:)
    @NSManaged public func insertIntoSaveBookmark(_ values: [CDNews], at indexes: NSIndexSet)

    @objc(removeSaveBookmarkAtIndexes:)
    @NSManaged public func removeFromSaveBookmark(at indexes: NSIndexSet)

    @objc(replaceObjectInSaveBookmarkAtIndex:withObject:)
    @NSManaged public func replaceSaveBookmark(at idx: Int, with value: CDNews)

    @objc(replaceSaveBookmarkAtIndexes:withSaveBookmark:)
    @NSManaged public func replaceSaveBookmark(at indexes: NSIndexSet, with values: [CDNews])

    @objc(addSaveBookmarkObject:)
    @NSManaged public func addToSaveBookmark(_ value: CDNews)

    @objc(removeSaveBookmarkObject:)
    @NSManaged public func removeFromSaveBookmark(_ value: CDNews)

    @objc(addSaveBookmark:)
    @NSManaged public func addToSaveBookmark(_ values: NSOrderedSet)

    @objc(removeSaveBookmark:)
    @NSManaged public func removeFromSaveBookmark(_ values: NSOrderedSet)

}

// MARK: Generated accessors for sentNews
extension CDUser {

    @objc(insertObject:inSentNewsAtIndex:)
    @NSManaged public func insertIntoSentNews(_ value: CDNews, at idx: Int)

    @objc(removeObjectFromSentNewsAtIndex:)
    @NSManaged public func removeFromSentNews(at idx: Int)

    @objc(insertSentNews:atIndexes:)
    @NSManaged public func insertIntoSentNews(_ values: [CDNews], at indexes: NSIndexSet)

    @objc(removeSentNewsAtIndexes:)
    @NSManaged public func removeFromSentNews(at indexes: NSIndexSet)

    @objc(replaceObjectInSentNewsAtIndex:withObject:)
    @NSManaged public func replaceSentNews(at idx: Int, with value: CDNews)

    @objc(replaceSentNewsAtIndexes:withSentNews:)
    @NSManaged public func replaceSentNews(at indexes: NSIndexSet, with values: [CDNews])

    @objc(addSentNewsObject:)
    @NSManaged public func addToSentNews(_ value: CDNews)

    @objc(removeSentNewsObject:)
    @NSManaged public func removeFromSentNews(_ value: CDNews)

    @objc(addSentNews:)
    @NSManaged public func addToSentNews(_ values: NSOrderedSet)

    @objc(removeSentNews:)
    @NSManaged public func removeFromSentNews(_ values: NSOrderedSet)

}

extension CDUser : Identifiable {

}
