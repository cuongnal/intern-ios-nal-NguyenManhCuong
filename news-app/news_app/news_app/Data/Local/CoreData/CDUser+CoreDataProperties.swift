//
//  CDUser+CoreDataProperties.swift
//  news_app
//
//  Created by Manhcuong on 25/04/2024.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var email: String?
    @NSManaged public var listItemShow: Dictionary<String , Array<Int> >?
    @NSManaged public var idUser: String?
    @NSManaged public var listIndexCategory: Dictionary<String , Array<Int> >?
    @NSManaged public var saveBookmark: NSSet?
    @NSManaged public var sentNews: NSSet?

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

// MARK: Generated accessors for sentNews
extension CDUser {

    @objc(addSentNewsObject:)
    @NSManaged public func addToSentNews(_ value: CDNews)

    @objc(removeSentNewsObject:)
    @NSManaged public func removeFromSentNews(_ value: CDNews)

    @objc(addSentNews:)
    @NSManaged public func addToSentNews(_ values: NSSet)

    @objc(removeSentNews:)
    @NSManaged public func removeFromSentNews(_ values: NSSet)

}

extension CDUser : Identifiable {

}
