//
//  CDNewsExtension.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation
import CoreData

extension CDNews {
    @nonobjc public class func getCDNewsByCategory(idCate : UUID) throws -> [CDNews]  {
        let a = CDNews.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.idCate), idCate as CVarArg)
        return try AppDelegate.context.fetch(a)
    }
    @nonobjc public class func getCDNews(withNewsEntity news : News) throws -> CDNews? {
        let a = CDNews.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDNews.idNews), news.idNews as CVarArg)
        return try AppDelegate.context.fetch(a).first
    }
    @nonobjc public class func insertCDListNews(listNews : [News], category : Category? = nil) throws -> Bool {
        for item in listNews {
            let cdN = CDNews(context: AppDelegate.context)
            let cate = try CDCategory.getCDCategory(idCate: item.idCate)
            cdN.author = item.author
            cdN.des = item.description
            cdN.idNews = item.idNews
            cdN.image = item.image
            cdN.link = item.link
            cdN.pubDate = item.pubDate
            cdN.title = item.title
            cdN.idCate = item.idCate
            cate?.addToCategoriesNews(cdN)
        }
        try AppDelegate.context.save()
        return true
    }
    @nonobjc public class func getAll() throws -> [CDNews] {
        let a = CDNews.fetchRequest()
        return try AppDelegate.context.fetch(a)
    }
    
    @nonobjc public class func saveSeenNewsWithUser (withNews news : News, withUser user : User) throws {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        let cdNews = try CDNews.getCDNews(withNewsEntity: news)
        guard let cdNews = cdNews else {
            return
        }
        cdUser?.addToSeenNews(cdNews)
        try AppDelegate.context.save()
    }
    @nonobjc public class func saveBookmarkWithUser(withNews news : News , withUser user : User) throws {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        let cdNews = try CDNews.getCDNews(withNewsEntity: news)
        guard let cdNews = cdNews else {
            return
        }
        cdUser?.addToSaveBookmark(cdNews)
        try AppDelegate.context.save()
    }

    @nonobjc public class func getSeenWithUser(withUser user : User) throws -> [CDNews] {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        let a = CDNews.fetchRequest()
        if let cdUser = cdUser {
            a.predicate = NSPredicate(format: "ANY seenNews == %@", cdUser)
            return try AppDelegate.context.fetch(a)
        }
        return []
    }
    @nonobjc public class func getBookmarkWithUser(withUser user : User) throws -> [CDNews] {
        let cdUser = try CDUser.fetchUserById(idUser: user.idUser!)
        let a = CDNews.fetchRequest()
        if let cdUser = cdUser {
            a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDNews.saveBookmark), cdUser)
            return try AppDelegate.context.fetch(a)
        }
        return []
    }
    
    
    
}
