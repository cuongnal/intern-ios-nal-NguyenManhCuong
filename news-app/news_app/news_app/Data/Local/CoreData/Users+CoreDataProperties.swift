//
//  Users+CoreDataProperties.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var idUser: UUID?
    @NSManaged public var listIndexCategories: Array<Int>?
    @NSManaged public var usersBookmark: NSSet?

}

// MARK: Generated accessors for usersBookmark
extension Users {

    @objc(addUsersBookmarkObject:)
    @NSManaged public func addToUsersBookmark(_ value: Bookmark)

    @objc(removeUsersBookmarkObject:)
    @NSManaged public func removeFromUsersBookmark(_ value: Bookmark)

    @objc(addUsersBookmark:)
    @NSManaged public func addToUsersBookmark(_ values: NSSet)

    @objc(removeUsersBookmark:)
    @NSManaged public func removeFromUsersBookmark(_ values: NSSet)

}

extension Users : Identifiable {

}
