//
//  CategoriesUseCase.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class DataMapper {
    
    class func MapCDCategoryToEntity(withTypeSource type: TypeSource, withUser user: User, cdCategory : [CDCategory]) -> [Category] {
        var arr : [Category] = []
        for i in stride(from: 0, to: user.listIndexCategory![type.rawValue]!.count, by:1) {
            let indexCategory : Int = user.listIndexCategory![type.rawValue]![i]
            var item : Category = Category()
            
            let tg = cdCategory.first(where: {$0.indexCategory == indexCategory})
            if let tg = tg {
                item.idCate = tg.idCate
                item.url = tg.url
                item.typeSource = tg.typeSource
                item.title = tg.title
                item.index = Int(tg.indexCategory)
                arr.append(item)
            }
        }
        return arr
    }
    
    class func MapCDCategoryToEntity(withCDCategory arrCDCate : [CDCategory]) -> [Category] {
        var arr : [Category] = []
        for tg in arrCDCate {
            var item = Category()
            item.idCate = tg.idCate
            item.url = tg.url
            item.typeSource = tg.typeSource
            item.title = tg.title
            arr.append(item)
        }
        return arr
    }
    class func MapCDUsertoEntity(withCDUser cdUser: CDUser) -> User {
        return User(idUser: cdUser.idUser, email: cdUser.email, listIndexCategory: cdUser.listIndexCategory, listItemShow: cdUser.listItemShow)
    }
    class func MapCDNewsToEntity(withCDNews cdNews : CDNews) -> News {
        var news = News()
        news.idNews = cdNews.idNews ?? ""
        news.urlImage = cdNews.image ?? ""
        news.title = cdNews.title ?? ""
        news.pubDate = cdNews.pubDate ?? ""
        news.idCate = cdNews.idCate!
        news.author = cdNews.author ?? ""
        news.typeCategory = cdNews.categoriesNews?.title ?? ""
        news.link = cdNews.link ?? ""
        news.des = cdNews.des ?? ""
        return news
    }
    class func MapCDNewsToEntity(withArrayCDNews arrCDNews : [CDNews]) -> [News] {
        var arr : [News] = []
        for item in arrCDNews {
            var news = News()
            news.idNews = item.idNews ?? ""
            news.urlImage = item.image ?? ""
            news.title = item.title ?? ""
            news.pubDate = item.pubDate ?? ""
            news.idCate = item.idCate!
            news.author = item.author ?? ""
            news.typeCategory = item.categoriesNews?.title ?? ""
            news.link = item.link ?? ""
            news.des = item.des ?? ""
            arr.append(news)
        }
        return arr
    }

}
