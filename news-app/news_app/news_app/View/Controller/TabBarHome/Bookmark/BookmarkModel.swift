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
    var arrNews : [News] = []
    
    init(newsRepository: NewsRepository!, categoryRepository: CategoryRepository!) {
        self.newsRepository = newsRepository
        self.categoryRepository = categoryRepository
    }
   
    func getCategoryAndNews(callBack : @escaping (([Category]) -> Void) ) {
        excuteTask(task: { [weak self] in
            let arrNews = self?.newsRepository.getBookmarkOfUser(withUserLogin: UserDefaults.getUser()!)
            let arrUUID = self?.filterCategory(arrNews: arrNews)
            guard let arrUUID = arrUUID else {return}
            let arrCate = self?.categoryRepository.getCategoryWithUUID(withUUIDs: arrUUID)
            self?.arrCategory = arrCate ?? []
            self?.arrNews = arrNews ?? []
        }, complete: { [self] _ in
            callBack(arrCategory)
        })
    }
    func getBookmarkOfCategory(withCategory cate: Category, callBack : @escaping (([News]?) -> Void)) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.getBookmarkOfCategory(withUserLogin: UserDefaults.getUser()!, category: cate)
        }, complete: { (arrNewsOfCategory) in
            callBack(arrNewsOfCategory)
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
    
}
