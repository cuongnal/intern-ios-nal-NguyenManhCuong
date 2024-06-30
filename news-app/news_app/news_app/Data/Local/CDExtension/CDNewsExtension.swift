//
//  CDNewsExtension.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation
import CoreData

private let insertNewsSemaphore = DispatchSemaphore(value: 1)

extension CDNews {
    public class func getCDNewsByCategory(idCate : UUID) throws -> [CDNews]  {
        let a = CDNews.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.idCate), idCate as CVarArg)
        return try AppDelegate.context.fetch(a)
    }
    public class func getCDNews(withNewsEntity news : News) throws -> CDNews? {
        let a = CDNews.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDNews.idNews), news.idNews as CVarArg)
        return try AppDelegate.context.fetch(a).first
    }
    public class func insertNews(listNews : [News], category : Category? = nil) throws -> Bool {
        try AppDelegate.context.performAndWait {
            for item in listNews {
                let a = CDNews.fetchRequest()
                a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDNews.idNews), item.idNews as CVarArg)
                if try AppDelegate.context.fetch(a).count == 0 {
                    let cdN = CDNews(context: AppDelegate.context)
                    let cate = try CDCategory.getCDCategory(idCate: item.idCate)
                    cdN.author = item.author
                    cdN.des = item.des
                    cdN.idNews = item.idNews
                    cdN.image = item.urlImage
                    cdN.link = item.link
                    cdN.pubDate = item.pubDate
                    cdN.title = item.title
                    cdN.idCate = item.idCate
                    cate?.addToCategoriesNews(cdN)
                }
            }
            try AppDelegate.context.save()
        }
        return true
        
    }
    public class func getAll() throws -> [CDNews] {
        let a = CDNews.fetchRequest()
        return try AppDelegate.context.fetch(a)
    }
    
    public class func saveSentNewsWithUser (withNews news : News, withUser user : User) throws {
        guard let cdUser = try CDUser.fetchUserById(idUser: user.idUser!),
              let cdNews = try CDNews.getCDNews(withNewsEntity: news) else {
            return
        }
        if let sentNewsSet = cdUser.sentNews {
            let sentNewsArray = sentNewsSet.array as! [CDNews]
            if let existingIndex = sentNewsArray.firstIndex(of: cdNews) {
                cdUser.removeFromSentNews(at: existingIndex)
            }
        }
        cdUser.insertIntoSentNews(cdNews, at: 0)
        try AppDelegate.context.save()
    }
    public class func saveBookmarkWithUser(withNews news : News , withUser user : User) throws -> Bool{
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        let cdNews = try CDNews.getCDNews(withNewsEntity: news)
        guard let cdNews = cdNews else {
            return false
        }
        try AppDelegate.context.performAndWait {
            cdUser?.insertIntoSaveBookmark(cdNews, at: 0)
            try AppDelegate.context.save()
        }
        return true
    }
    
    public class func getSentWithUser(withUser user : User) throws -> [CDNews] {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        if let cdUser = cdUser, let sentNews = cdUser.sentNews?.array as? [CDNews] {
            return sentNews
        }
        return []
    }
    public class func getBookmarkWithUser(withUser user : User) throws -> [CDNews] {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        if let cdUser = cdUser {
            return cdUser.saveBookmark?.array as? [CDNews] ?? []
        }
        return []
    }
    public class func getBookmarkWithUser(withUser user : User, withCategory category : Category) throws -> [CDNews] {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        let a = CDNews.fetchRequest()
        if let cdUser = cdUser {
            let preFirst = NSPredicate(format: "ANY saveBookmark == %@", cdUser)
            let preSecond = NSPredicate(format: "%K == %@", #keyPath(CDNews.idCate),category.idCate! as CVarArg )
            a.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [preFirst,preSecond])
            return try AppDelegate.context.fetch(a)
        }
        return []
    }
    
    public class func isBookmarkUser (withNews news : News, withUser user : User) throws -> Bool {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        let a = CDNews.fetchRequest()
        if let cdUser = cdUser {
            let preFirst = NSPredicate(format: "ANY saveBookmark == %@", cdUser)
            let preSecond = NSPredicate(format: "%K == %@", #keyPath(CDNews.idNews),news.idNews as CVarArg )
            a.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [preFirst,preSecond])
            return try AppDelegate.context.fetch(a).count != 0
        }
        return false
    }
    public class func deleteBookmarkItemNews(withNews news : News, user : User) throws {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        let a = CDNews.fetchRequest()
        if let cdUser = cdUser {
            let preFirst = NSPredicate(format: "ANY saveBookmark == %@", cdUser)
            let preSecond = NSPredicate(format: "%K == %@", #keyPath(CDNews.idNews),news.idNews as CVarArg )
            a.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [preFirst,preSecond])
            
            let itemDelete = try AppDelegate.context.fetch(a).first
            guard let itemDelete = itemDelete else {
                return
            }
            cdUser.removeFromSaveBookmark(itemDelete)
            try AppDelegate.context.save()
        }
        
    }
    public class func deleteNewsOfCategory(withCategory category : Category) throws{
        try AppDelegate.context.performAndWait {
            let a = CDNews.fetchRequest()
            a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDNews.idCate), category.idCate! as CVarArg)
            let arrCDNews = try AppDelegate.context.fetch(a)
            
            let user = CDUser.fetchRequest()
            for itemCDNews in arrCDNews {
                user.predicate = NSPredicate(format: "ANY saveBookmark == %@", itemCDNews)
                let cdUser = try AppDelegate.context.fetch(user).first
                if cdUser == nil {
                    AppDelegate.context.delete(itemCDNews)
                    try AppDelegate.context.save()
                }
            }
            try AppDelegate.context.save()
        }
    }
    public class func getAllBookmarkWithUser(withUser user : User) throws -> [CDNews] {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        let a = CDNews.fetchRequest()
        if let cdUser = cdUser {
            return cdUser.saveBookmark?.array as? [CDNews] ?? []
        }
        return []
    }
    
}
