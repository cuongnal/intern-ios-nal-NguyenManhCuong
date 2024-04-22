//
//  LocalNewsRepository.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
//

import Foundation

protocol NewsRepository {
    func getAllNews() -> [CDNews]
    
    func getNewsOfCategory(category: Category) -> [News]
    
    func insertNewsByCategory(arrNews : [News]) -> Bool
    
    func getNewsFromServer(category : Category ) -> [News]
    
    func getAllNewsFromServerSource (typeSource : TypeSource) -> [News]
    
    func insertNewsSentWithUser (withUserLogin user : User , withNews news : News)
    
    func getNewsSentWithUser(withUserLogin user : User)  -> [News]
    
    func insertNewsToBookmark(withNews news : News, withUserLogin user : User) -> Bool
    
    func getBookmarkOfUser (withUserLogin user : User) -> [News]
    
    func getBookmarkOfCategory(withUserLogin user : User, category : Category) -> [News]
    
    func isBookmarkUser(news : News, withUserLogin user : User) -> Bool
    
    func deleteBookmarkItem(withNews news : News, withUserLogin user : User)
    
    func deleteNewsOfCategory(withCategory category : Category)
}
