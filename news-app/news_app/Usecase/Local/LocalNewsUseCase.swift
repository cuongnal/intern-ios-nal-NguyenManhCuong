//
//  NewsUseCase.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class LocalNewsUseCase {
    let localNewsRepository = LocalNewsRepositoryImp()
    
    func getAllNewsLocal() -> [News] {
        //        let arrCDNews = localNewsRepository.getAllNews()
        //        var arrNews : [News] = []
        //        arrCDNews.forEach({item in
        //            arrNews.append(News(idNews: item.idNews!, image: item.image!, title: item.title!, pubDate: item.pubDate!, idCategory: item.idCategory!, author: item.author!, type: Constant.Ca, link: <#T##String#>, description: <#T##String#>
        //        })
        return []
    }
    func insertNews(news : News, category : Category) {
        var arrCDNews = localNewsRepository.getNewsByCategory(category: category)
        _ = localNewsRepository.insertNewsByCategory(arrNews: arrCDNews, category: category)
        
    }
}
