//
//  News+CoreDataProperties.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News")
    }

    @NSManaged public var author: String?
    @NSManaged public var des: String?
    @NSManaged public var idNews: Int64
    @NSManaged public var image: String?
    @NSManaged public var link: String?
    @NSManaged public var pubDate: String?
    @NSManaged public var title: String?
    @NSManaged public var bookmark: NSSet?
    @NSManaged public var categories: Categories?

}

// MARK: Generated accessors for bookmark
extension News {

    @objc(addBookmarkObject:)
    @NSManaged public func addToBookmark(_ value: Bookmark)

    @objc(removeBookmarkObject:)
    @NSManaged public func removeFromBookmark(_ value: Bookmark)

    @objc(addBookmark:)
    @NSManaged public func addToBookmark(_ values: NSSet)

    @objc(removeBookmark:)
    @NSManaged public func removeFromBookmark(_ values: NSSet)

}

extension News : Identifiable {

}
