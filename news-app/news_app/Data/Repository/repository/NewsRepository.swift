//
//  LocalNewsRepository.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
//

import Foundation

protocol NewsRepository {
    func getAllNews() -> [CDNews]
    
    func getNewsByCategory(category: Category) -> [News]
    
    func insertNewsByCategory(arrNews : [News]) -> Bool
    
    func getNewsFromServer(category : Category ) -> [News]
    
    func getAllNewsFromServerSource (typeSource : TypeSource) -> [News]
    
    
    func getNewsSentWithUser(withUserLogin user : User)  -> [News]
    
    func insertNewsToBookmark(withNews news : News, withUserLogin user : User)
    
    func getBookmarkWithUser (withUserLogin user : User) -> [News]
}
