//
//  LocalNewsRepository.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
//

import Foundation

class NewsRepositoryImp : NewsRepository {

    let parser = XMLParserToObject.getInstance()
    
    func getNewsByCategory(category: Category) -> [News] {
        do {
            let arrCDNews = try CDNews.fetchNewsByCategory(idCate: category.idCate)
            var arrNews : [News] = []
            for item in arrCDNews {
                arrNews.append(DataMapper.MapCDNewsToEntity(withCDNews: item))
            }
            return arrNews
        }
        catch let err {
            print("Lỗi khi getNewsByCategory \(err)")
        }
        return []
    }
    func getAllNews() -> [CDNews] {
        do {
            let arr = try CDNews.getAll()
            return arr
        }catch let err {
            print("Lỗi khi getAllNews\(err)")
            return []
        }
    }
    func insertNewsByCategory(arrNews : [News]) -> Bool {
        do {
            _ = try CDNews.insertListNews(listNews: arrNews)
            return true
        }
        catch let err {
            print("Lỗi khi insertNewsByCategory \(err)")
            return false
        }
    }
    
    func getNewsFromServer(category : Category ) -> [News] {
        return parser.callFromByUrl(category: category)
    }
    
    func getAllNewsFromServerSource (typeSource : TypeSource) -> [News] {
        var arrNews : [News] = []
        if typeSource == .vnExpress {
            for item in Constant.CATEGORY_VN_EXPRESS {
                arrNews.append(contentsOf: parser.callFromByUrl(category: item))
            }
        }
        else {
            for item in Constant.CATEGORY_TUOI_TRE {
                arrNews.append(contentsOf: parser.callFromByUrl(category: item))
            }
        }
        return arrNews
    }
    
}
