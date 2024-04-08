//
//  CDBookmark+CoreDataProperties.swift
//  news_app
//
//  Created by user on 4/5/24.
//
//

import Foundation
import CoreData


extension CDBookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBookmark> {
        return NSFetchRequest<CDBookmark>(entityName: "CDBookmark")
    }

    @NSManaged public var idNews: String?
    @NSManaged public var idUser: String?
    @NSManaged public var newsBookmark: CDNews?
    @NSManaged public var usersBookmark: CDUser?

}

extension CDBookmark : Identifiable {

}
