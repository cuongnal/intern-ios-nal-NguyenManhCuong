//
//  NewsByTypeImp.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//

import Foundation

class NewsRepositoryImp : NewsRepository {
    func getNewsDetail(newsItem : ItemRss?) -> URLRequest? {
        guard let item = newsItem  else {
            return nil
        }
        return URLRequest(url: URL(string: item.link)!, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 2.0)
    }
    
    let parser = XMLParserToObject.getInstance()
    func getNewsByTypeCategory(category : Category ) -> [ItemRss] {
       return parser.callFromByUrl(category: category)
    }
    
}
