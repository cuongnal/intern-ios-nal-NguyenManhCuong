//
//  News+CoreDataProperties.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
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
    @NSManaged public var idNews: UUID?
    @NSManaged public var image: String?
    @NSManaged public var link: String?
    @NSManaged public var pubDate: String?
    @NSManaged public var title: String?
    @NSManaged public var categoriesNews: Categories?
    @NSManaged public var newsBookmark: NSSet?

}

// MARK: Generated accessors for newsBookmark
extension News {

    @objc(addNewsBookmarkObject:)
    @NSManaged public func addToNewsBookmark(_ value: Bookmark)

    @objc(removeNewsBookmarkObject:)
    @NSManaged public func removeFromNewsBookmark(_ value: Bookmark)

    @objc(addNewsBookmark:)
    @NSManaged public func addToNewsBookmark(_ values: NSSet)

    @objc(removeNewsBookmark:)
    @NSManaged public func removeFromNewsBookmark(_ values: NSSet)

}

extension News : Identifiable {

}
