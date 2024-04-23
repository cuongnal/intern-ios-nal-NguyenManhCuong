//
//  HomeModel.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation
//import Kingfisher
class HomeModel : BaseModel {
    var newsRepository : NewsRepository = NewsRepositoryImp()
    var arrNews : [News] = []
    var categoryRepository = CategoryRepositoryImp()
    var userRepository : UsersRepository = UsersRepositoryImp()
    
    
    func fetchDataNews(category : Category, callback : @escaping (([News]) -> Void)) {
        excuteTask(
            task: { [weak self] in
                let arr =  self?.newsRepository.getNewsOfCategory(category: category)
                self?.arrNews.removeAll()
                self?.arrNews.append(contentsOf: arr ?? [])
                return arr
            },
            complete: { (arr) in
                callback(arr ?? [])
            }
        )
    }
    func fetchDataNewsRemote(category : Category, callback : @escaping ( ([News]) -> Void)) {
        excuteNetwork(
        task: { [weak self] in
            let arr = self?.newsRepository.getNewsFromServer(category: category)
            self?.arrNews.append(contentsOf: arr ?? [])
            return arr
        }, complete: {[weak self](arr) in
            callback(arr ?? [])
            self?.updateDataNewsLocal(category: category, arr : arr ?? [])
        })
    }
    private func updateDataNewsLocal(category : Category, arr : [News]) {
        excuteTask(task: { [weak self] in
            guard !arr.isEmpty else {return}
            self?.newsRepository.deleteNewsOfCategory(withCategory:category)
            _ = self?.newsRepository.insertNewsByCategory(arrNews: arr)
        }, complete: nil)
    }
    func getCategoryByUser(typeClick : TypeClickPopover, callback : @escaping (([Category]) -> Void) ) {
        let type = typeClick == .tuoiTre ? TypeSource.tuoiTre : TypeSource.vnExpress
        excuteTask(
            task: {[weak self] in
                return self?.categoryRepository.getCategoriesByTypeSource(withTypeSource: type, withUser: UserDefaults.getUser()!)
            },
            complete: { (arrCategory) in
                if let arrCategory = arrCategory {
                    callback(arrCategory)
                }
            })
    }
    
    func saveBookmark(withNews news : News, callback : @escaping (() -> Void) ) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.insertNewsToBookmark(withNews: news, withUserLogin: UserDefaults.getUser()!)
        }, complete: {_ in
            callback()
        })
    }
    
    func updateIndexCategoryOfUser(categories : [Category]) {
        excuteTask(task: { [weak self] in
            let dicIndex = self?.userRepository.updateIndexCategories(withCategories: categories, user: UserDefaults.getUser()!)
            let user = UserDefaults.getUser()
            guard let dicIndex = dicIndex, var user = user else {return}
            user.listIndexCategory = dicIndex
            UserDefaults.setUser(user: user)
        }, complete: nil)
    }
    
    func isBookmarkUser(withNews news : News, callbackIsBookmark : @escaping (Bool) -> ()) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.isBookmarkUser(news: news, withUserLogin: UserDefaults.getUser()!)
        }, complete: { (isBookmark) in
            guard let isBookmark = isBookmark else {
                callbackIsBookmark(false)
                return
            }
            callbackIsBookmark(isBookmark)
        }
        )
    }
    func deleteBookmarkNews (withNews news : News) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.deleteBookmarkItem(withNews: news, withUserLogin: UserDefaults.getUser()! )
            return self?.newsRepository.getBookmarkOfCategory(withUserLogin: UserDefaults.getUser()!, category: Category(idCate: news.idCate))
        }, complete: nil)
    }
    

    func searchNewsWithCategory (withArrayText arrText : [String], callBack: @escaping (([News]) -> Void)) {
        excuteTask(task: { [weak self] in
            
            guard arrText.count != 0 else {return self?.arrNews}
            var resultSearchNews : [News] = []
            guard let arrNews = self?.arrNews else { return resultSearchNews }
            
            for item in arrNews {
                let isMatch = arrText.allSatisfy { keyword in
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

