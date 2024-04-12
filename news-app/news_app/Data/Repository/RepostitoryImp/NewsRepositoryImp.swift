//
//  LocalNewsRepository.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
//

import Foundation

class NewsRepositoryImp : NewsRepository {
    
    
    let parser = XMLParserToObject.getInstance()
    
    func getNewsOfCategory(category: Category) -> [News] {
        do {
            let arrCDNews = try CDNews.getCDNewsByCategory(idCate: category.idCate)
            var arrNews : [News] = []
            for item in arrCDNews {
                arrNews.append(DataMapper.MapCDNewsToEntity(withCDNews: item))
            }
            return arrNews
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
        }
        return []
    }
    func getAllNews() -> [CDNews] {
        do {
            let arr = try CDNews.getAll()
            return arr
        }catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
    }
    func insertNewsByCategory(arrNews : [News]) -> Bool {
        do {
            _ = try CDNews.insertNews(listNews: arrNews)
            return true
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
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
    func insertNewsSentWithUser (withUserLogin user : User , withNews news : News) {
        do {
            try CDNews.saveSentNewsWithUser(withNews: news, withUser: user)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
        }
    }
    func getNewsSentWithUser(withUserLogin user : User)  -> [News]{
        do {
            let arrCDNews = try CDNews.getSentWithUser(withUser: user)
            return DataMapper.MapCDNewsToEntity(withArrayCDNews: arrCDNews)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
    }
    
    func insertNewsToBookmark(withNews news: News, withUserLogin user: User){
        do {try CDNews.saveBookmarkWithUser(withNews: news, withUser: user)}
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
        }
    }
    
    func getBookmarkOfUser(withUserLogin user: User) -> [News] {
        do {
            let arr = try CDNews.getBookmarkWithUser(withUser: user)
            return DataMapper.MapCDNewsToEntity(withArrayCDNews: arr)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
    }
    func getBookmarkOfCategory(withUserLogin user : User, category : Category) -> [News] {
        do {
            let arrCDNews = try CDNews.getBookmarkWithUser(withUser: user, withCategory: category)
            return DataMapper.MapCDNewsToEntity(withArrayCDNews: arrCDNews)
        }
        catch let err{
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
    }
    
}
