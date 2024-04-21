//
//  SearchModel.swift
//  news_app
//
//  Created by user on 4/11/24.
//

import Foundation
class SearchModel  : BaseModel{
    let newsRepository : NewsRepository!
    
    init(newsRepository: NewsRepository!) {
        self.newsRepository = newsRepository
    }
    
    func getAllNews(callback : @escaping ([News]) -> Void) {
        excuteTask(blockUI: true, task: { [weak self] in
            self?.newsRepository.getNewsSentWithUser(withUserLogin: UserDefaults.getUser()!)
        }, complete: {(arrNews) in
            callback(arrNews!)
        })
    }
    
}

