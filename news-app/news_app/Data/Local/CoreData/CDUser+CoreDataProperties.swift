//
//  CDUser+CoreDataProperties.swift
//  news_app
//
//  Created by user on 4/5/24.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var idUser: String?
    @NSManaged public var listIndexCategories: Dictionary<String , Array<Int> >?
    @NSManaged public var email: String?
    @NSManaged public var usersBookmark: NSSet?

}

// MARK: Generated accessors for usersBookmark
extension CDUser {

    @objc(addUsersBookmarkObject:)
    @NSManaged public func addToUsersBookmark(_ value: CDBookmark)

    @objc(removeUsersBookmarkObject:)
    @NSManaged public func removeFromUsersBookmark(_ value: CDBookmark)

    @objc(addUsersBookmark:)
    @NSManaged public func addToUsersBookmark(_ values: NSSet)

    @objc(removeUsersBookmark:)
    @NSManaged public func removeFromUsersBookmark(_ values: NSSet)

}

extension CDUser : Identifiable {

}
