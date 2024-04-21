//
//  BookmarkModel.swift
//  news_app
//
//  Created by user on 4/11/24.
//

import Foundation
import UIKit

class BookmarkModel : BaseModel {
    var newsRepository : NewsRepository!
    var categoryRepository : CategoryRepository!
    var arrCategory : [Category] = []

    
    init(newsRepository: NewsRepository!, categoryRepository: CategoryRepository!) {
        self.newsRepository = newsRepository
        self.categoryRepository = categoryRepository
    }
    
    func getCategoryAndNews(callback : @escaping (([Category]) -> Void) ) {
        excuteTask(task: { [weak self] in
            let arrNews = self?.newsRepository.getBookmarkOfUser(withUserLogin: UserDefaults.getUser()!)
            let arrUUID = self?.filterCategory(arrNews: arrNews)
            guard let arrUUID = arrUUID else {return}
            let arrCate = self?.categoryRepository.getCategoryWithUUID(withUUIDs: arrUUID)
            self?.arrCategory = arrCate ?? []
        }, complete: { [self] _ in
            callback(arrCategory)
        })
    }
    func getBookmarkOfCategory(withCategory cate: Category, callback : @escaping (([News]?) -> Void)) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.getBookmarkOfCategory(withUserLogin: UserDefaults.getUser()!, category: cate)
        }, complete: { (arrNewsOfCategory) in
            callback(arrNewsOfCategory)
        })
    }
    private func filterCategory(arrNews : [News]?) -> [UUID] {
        var set: Set<UUID> = []
        guard let arrNews = arrNews else {return []}
        
        for item in arrNews {
            set.insert(item.idCate)
        }
        return Array(set)
    }
    
    func  unBookmarkNews (withNews news : News, callBack : @escaping (([News]) -> Void)) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.deleteBookmarkItem(withNews: news, withUserLogin: UserDefaults.getUser()! )
           return self?.newsRepository.getBookmarkOfCategory(withUserLogin: UserDefaults.getUser()!, category: Category(idCate: news.idCate))
        }, complete: { (arrNews) in
            callBack(arrNews ?? [])
        })
    }
}
