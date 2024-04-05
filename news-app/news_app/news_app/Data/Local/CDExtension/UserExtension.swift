//
//  UserExtension.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation
import CoreData

extension CDUser {
    @nonobjc public class func fetchUserById(idUser : String) -> NSFetchRequest<CDUser> {
        let a = NSFetchRequest<CDUser>(entityName: "CDUser")
        a.predicate = NSPredicate(format: "idUser == %@", idUser as CVarArg)
        return a
    }
}
