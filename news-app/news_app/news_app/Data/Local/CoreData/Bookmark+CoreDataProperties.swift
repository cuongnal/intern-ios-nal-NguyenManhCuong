//
//  Bookmark+CoreDataProperties.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
//
//

import Foundation
import CoreData


extension Bookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmark> {
        return NSFetchRequest<Bookmark>(entityName: "Bookmark")
    }

    @NSManaged public var idUser: UUID?
    @NSManaged public var idNews: UUID?
    @NSManaged public var newsBookmark: News?
    @NSManaged public var usersBookmark: Users?

}

extension Bookmark : Identifiable {

}
