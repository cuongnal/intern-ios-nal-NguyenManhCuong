//
//  UserExtension.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation
import CoreData

extension CDUser {
    @nonobjc public class func fetchUserById(idUser : String) throws -> CDUser? {
        let a = CDUser.fetchRequest()
        a.predicate = NSPredicate(format: "idUser == %@", idUser as CVarArg)
        return try AppDelegate.context.fetch(a).first
    }
    @nonobjc public class func insertUser(withUser user : User) throws -> CDUser? {
        let u = CDUser(context: AppDelegate.context)
        u.email = user.email
        u.idUser = user.email
        u.listIndexCategory = user.listIndexCategory
        try AppDelegate.context.save()
        return u
    }
}
