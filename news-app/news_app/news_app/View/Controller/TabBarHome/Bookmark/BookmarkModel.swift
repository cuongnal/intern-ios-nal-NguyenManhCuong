//
//  BookmarkModel.swift
//  news_app
//
//  Created by user on 4/11/24.
//

import Foundation
import UIKit

class BookmarkModel : BaseModel {
    var newsRepository = NewsRepositoryImp()
    var categoryRepository = CategoryRepositoryImp()
    var arrCategory : [Category] = []
    var arrNews : [News] = []
    
    
    func getCategoryAndNews(callBack : @escaping (([News],[Category]) -> Void) ) {
        excuteTask(task: { [weak self] in
            let arrNews = self?.newsRepository.getBookmarkWithUser(withUserLogin: UserDefaults.getUser()!)
            let arrCate = self?.categoryRepository.getAll()
            let arrCateDidFilter = self?.filterCategory(arrNews: arrNews!, arrCate: arrCate!)
            self?.arrCategory = arrCateDidFilter ?? []
            self?.arrNews = arrNews ?? []
        }, complete: { [self] (double) in
            callBack(arrNews,arrCategory)
        })
    }
    
    
    func filterCategory(arrNews : [News], arrCate : [Category]) -> [Category] {
        var set: Set<Category> = []
        for item in arrCate {
            let hasCategory = arrNews.contains { $0.idCate == item.idCate }
            if hasCategory {
                set.insert(item)
            }
        }
        return Array(set)
    }

}
