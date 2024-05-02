//
//  UserExtension.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation
import CoreData

extension CDUser {
    public class func fetchUserById(idUser : String) throws -> CDUser? {
        let a = CDUser.fetchRequest()
        a.predicate = NSPredicate(format: "idUser == %@", idUser as CVarArg)
        return try AppDelegate.context.fetch(a).first
    }
    public class func insertUser(withUser user : User) throws -> CDUser? {
        let u = CDUser(context: AppDelegate.context)
        u.email = user.email
        u.idUser = user.idUser
        u.listIndexCategory = user.listIndexCategory
        u.listItemShow = user.listItemShow
        try AppDelegate.context.save()
        return u
    }
    
    public class func updateUser(withDictionaryIndex dicIndex : Dictionary<String , Array<Int> >, with user : User) throws {
        let a = CDUser.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@",#keyPath(CDUser.idUser), user.idUser! )
        try AppDelegate.context.fetch(a).first?.listIndexCategory = dicIndex
        
        try AppDelegate.context.save()
    }
    public class func updateUser(user : User) throws {
        guard let idUser = user.idUser else {return}
        let u = CDUser.fetchRequest()
        u.predicate = NSPredicate(format: "%K == %@", #keyPath(CDUser.idUser), idUser as CVarArg)
        
        let cdUser = try AppDelegate.context.fetch(u).first
        
        cdUser?.listItemShow = user.listItemShow
        
        try AppDelegate.context.save()
    }
    
}
