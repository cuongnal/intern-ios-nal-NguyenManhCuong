//
//  Users+CoreDataProperties.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var idUser: Int64
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var bookmark: Bookmark?
    @NSManaged public var listCategory: ListCategory?

}

extension Users : Identifiable {

}
