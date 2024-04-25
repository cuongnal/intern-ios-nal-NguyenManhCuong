//
//  SearchModel.swift
//  news_app
//
//  Created by user on 4/11/24.
//

import Foundation
class SearchModel  : BaseModel{
    let newsRepository : NewsRepository!
    var arrNews : [News] = []
    init(newsRepository: NewsRepository!) {
        self.newsRepository = newsRepository
    }
    
    func getAllNews(callback : @escaping ([News]) -> Void) {
        excuteTask(blockUI: true, task: { [weak self] in
            let arr = self?.newsRepository.getNewsSentWithUser(withUserLogin: UserDefaults.getUser()!)
            self?.arrNews.removeAll()
            self?.arrNews.append(contentsOf: arr ?? [])
            return arr
        }, complete: {(arrNews) in
            callback(arrNews!)
        })
    }
    func searchNewsWithCategory (withArrayTextSearch searchText : String, callBack: @escaping (([News]) -> Void)) {
        excuteTask(task: { [weak self] in
            guard searchText.isNotEmpty() else {return self?.arrNews}
            
            let arrText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
            
            var arrTextSearch  : [String] = []
            for item in arrText {
                arrTextSearch.append(item.folding(options : .diacriticInsensitive,locale: Locale(identifier: "en_US")))
            }
            var resultSearchNews : [News] = []
            guard let arrNews = self?.arrNews else { return resultSearchNews }
            
            for item in arrNews {
                let isMatch = arrTextSearch.allSatisfy { keyword in
                    let folding = item.title.folding(options : .diacriticInsensitive,locale: Locale(identifier: "en_US"))
                    return folding.lowercased().contains(keyword.lowercased())
                }
                if isMatch { resultSearchNews.append(item) }
            }
            return resultSearchNews
        }, complete: { (arr) in
            callBack(arr ?? [])
        })
    }
    
}

