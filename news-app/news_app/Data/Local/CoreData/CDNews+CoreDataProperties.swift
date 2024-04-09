//
//  CDNews+CoreDataProperties.swift
//  news_app
//
//  Created by user on 4/9/24.
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
    @NSManaged public var newsBookmark: NSSet?

}

// MARK: Generated accessors for newsBookmark
extension CDNews {

    @objc(addNewsBookmarkObject:)
    @NSManaged public func addToNewsBookmark(_ value: CDBookmark)

    @objc(removeNewsBookmarkObject:)
    @NSManaged public func removeFromNewsBookmark(_ value: CDBookmark)

    @objc(addNewsBookmark:)
    @NSManaged public func addToNewsBookmark(_ values: NSSet)

    @objc(removeNewsBookmark:)
    @NSManaged public func removeFromNewsBookmark(_ values: NSSet)

}

extension CDNews : Identifiable {

}
