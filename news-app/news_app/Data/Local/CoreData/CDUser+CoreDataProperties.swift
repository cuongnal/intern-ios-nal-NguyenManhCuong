//
//  CDUser+CoreDataProperties.swift
//  news_app
//
//  Created by user on 4/11/24.
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
    @NSManaged public var seenNews: NSSet?
    @NSManaged public var saveBookmark: NSSet?

}

// MARK: Generated accessors for seenNews
extension CDUser {

    @objc(addSeenNewsObject:)
    @NSManaged public func addToSentNews(_ value: CDNews)

    @objc(removeSeenNewsObject:)
    @NSManaged public func removeFromSeenNews(_ value: CDNews)

    @objc(addSeenNews:)
    @NSManaged public func addToSeenNews(_ values: NSSet)

    @objc(removeSeenNews:)
    @NSManaged public func removeFromSeenNews(_ values: NSSet)

}

// MARK: Generated accessors for saveBookmark
extension CDUser {

    @objc(addSaveBookmarkObject:)
    @NSManaged public func addToSaveBookmark(_ value: CDNews)

    @objc(removeSaveBookmarkObject:)
    @NSManaged public func removeFromSaveBookmark(_ value: CDNews)

    @objc(addSaveBookmark:)
    @NSManaged public func addToSaveBookmark(_ values: NSSet)

    @objc(removeSaveBookmark:)
    @NSManaged public func removeFromSaveBookmark(_ values: NSSet)

}

extension CDUser : Identifiable {

}
