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
                arr.append(item)
            }
        }
        return arr
    }
    class func MapCDUsertoEntity(withCDUser cdUser: CDUser) -> User {
        return User(idUser: cdUser.idUser, email: cdUser.email, listIndexCategory: cdUser.listIndexCategory)
    }
    class func MapCDNewsToEntity(withCDNews cdNews : CDNews) -> News {
        var news = News()
        news.idNews = cdNews.idNews ?? ""
        news.image = cdNews.image ?? ""
        news.title = cdNews.title ?? ""
        news.pubDate = cdNews.pubDate ?? ""
        news.idCate = cdNews.idCate!
        news.author = cdNews.author ?? ""
        news.typeCategory = cdNews.categoriesNews?.title ?? ""
        news.link = cdNews.link ?? ""
        news.description = cdNews.des ?? ""
        return news
    }
}
