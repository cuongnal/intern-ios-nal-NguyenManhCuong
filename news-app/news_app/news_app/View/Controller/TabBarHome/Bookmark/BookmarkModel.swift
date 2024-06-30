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
    
    func getAllBookmarkOfUser(callback : @escaping (([News]?) -> Void)) {
        excuteTask(task: { [weak self] in
            let arr = self?.newsRepository.getAllBookmarkWithUser(withUserLogin: UserDefaults.getUser()!)
            self?.arrNews.removeAll()
            self?.arrNews.append(contentsOf: arr ?? [])
            return arr
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
    
    func unBookmarkNews (withNews news : News, callBack : @escaping (([News]) -> Void)) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.deleteBookmarkItem(withNews: news, withUserLogin: UserDefaults.getUser()! )
            let arr = self?.newsRepository.getBookmarkOfCategory(withUserLogin: UserDefaults.getUser()!, category: Category(idCate: news.idCate))
            self?.arrNews.removeAll()
            self?.arrNews.append(contentsOf: arr ?? [])
            return arr
        }, complete: { (arrNews) in
            callBack(arrNews ?? [])
        })
    }
    
    func searchNewsWithCategoryForBookmark (withArrayTextSearch searchText : String, callBack: @escaping (([News]) -> Void)) {
        excuteTask(task: { [weak self] in
            guard searchText.isNotEmpty() else {
                return self?.arrNews ?? []
            }
            
            let arrText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")

            var arrTextSearch  : [String] = []
            for item in arrText {
                arrTextSearch.append(item.folding(options : .diacriticInsensitive,locale: nil))
            }
            var resultSearchNews : [News] = []
            guard let arrNews = self?.arrNews else { return resultSearchNews }

            for item in arrNews {
                let isMatch = arrTextSearch.allSatisfy { keyword in
                    let folding = item.title.folding(options : .diacriticInsensitive,locale: nil)
                    return folding.lowercased().contains(keyword.lowercased())
                }
                if isMatch {
                    resultSearchNews.append(item)

                }
            }
            return resultSearchNews
        }, complete: { (arr) in
            callBack(arr ?? [])
        })
    }
}
