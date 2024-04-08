//
//  LocalNewsRepository.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
//

import Foundation

class LocalNewsRepositoryImp : LocalNewsRepository {
    
    func getNewsByCategory(category: Category) -> [CDNews] {
        do {
            var arrCDNews = try CDNews.fetchNewsByCategory(idCate: category.id)
            return arrCDNews
        }
        catch let err {
            print("Lỗi khi getNewsByCategory \(err)")
        }
        return []
    }
    
    func insertNewsByCategory(arrNews : [CDNews], category : Category ) -> Bool {
        do {
            var a = try CDNews.insertListNews(cdNews: arrNews, category: category)
            return true
        }
        catch let err {
            print("Lỗi khi insertNewsByCategory \(err)")
            return false
        }
    }
    
    
}
