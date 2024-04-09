//
//  CDNewsExtension.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation
import CoreData

extension CDNews {
    @nonobjc public class func fetchNewsByCategory(idCate : UUID) throws -> [CDNews]  {
        let a = CDNews.fetchRequest()
        a.predicate = NSPredicate(format: "%K == %@", #keyPath(CDCategory.idCate), idCate as CVarArg)
        return try AppDelegate.context.fetch(a)
    }
    @nonobjc public class func insertListNews(listNews : [News], category : Category? = nil) throws -> Bool {
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
}
