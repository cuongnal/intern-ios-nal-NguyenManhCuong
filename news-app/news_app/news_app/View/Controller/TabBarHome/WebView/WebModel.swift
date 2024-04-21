//
//  WebViewModel.swift
//  news_app
//
//  Created by hiepnv1 on 02/04/2024.
//

import Foundation
class WebModel : BaseModel {
    let newsRepository : NewsRepository
    var isCheckBookmarked = false
    init(newsRepository: NewsRepository) {self.newsRepository = newsRepository}
    
    func saveNews(withNews news : News) {
        self.newsRepository.insertNewsSentWithUser(withUserLogin:UserDefaults.getUser()! , withNews: news)
    }
    func saveBookmark(withNews news : News) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.insertNewsToBookmark(withNews: news, withUserLogin: UserDefaults.getUser()!)
        },complete: { [weak self] (isInsert) in
            guard let isInsert = isInsert else {
                self?.isCheckBookmarked = false
                return
            }
            self?.isCheckBookmarked = isInsert
        })
        
    }
    func isBookmarkUser(withNews news : News, callback : @escaping (Bool) -> ()) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.isBookmarkUser(news: news, withUserLogin: UserDefaults.getUser()!)
        }, complete: { [weak self](isBookmark) in
            guard let isBookmark = isBookmark else {
                callback(false)
                return
            }
            self?.isCheckBookmarked = isBookmark
            callback(isBookmark)
        }
        )
    }
    
}
