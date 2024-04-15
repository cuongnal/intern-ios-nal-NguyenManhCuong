//
//  HomeModel.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation
//import Kingfisher
class HomeModel : BaseModel {
    var newsRepository : NewsRepository! = NewsRepositoryImp()
    var arrNews : [News] = []
    var categoryRepository = CategoryRepositoryImp()
    
    
    func fetchDataNews(category : Category, callBack : @escaping (([News]) -> Void)) {
        excuteNetwork(
            task: { [weak self] in
                let arr =  self?.newsRepository.getNewsOfCategory(category: category)
                self?.arrNews.removeAll()
                self?.arrNews.append(contentsOf: arr ?? [])
            },
            complete: { [weak self] _ in
                guard let arr = self?.arrNews else {return}
                callBack(arr)
            }
        )
    }
    func getCategoryByUser(typeClick : TypeClickPopover, callBack : @escaping (([Category]) -> Void) ) {
        let type = typeClick == .tuoiTre ? TypeSource.tuoiTre : TypeSource.vnExpress
        excuteTask(
            task: {[weak self] in
                return self!.categoryRepository.getCategoriesByTypeSource(withTypeSource: type, withUser: UserDefaults.getUser()!)
            },
            complete: { (arrCategory) in
                callBack(arrCategory!)
            })
    }
    
    func saveBookmark(withNews news : News, callBack : @escaping (() -> Void) ) {
        excuteTask(task: { [weak self] in
            self?.newsRepository.insertNewsToBookmark(withNews: news, withUserLogin: UserDefaults.getUser()!)
        }, complete: {_ in
            callBack()
        })
    }
    
    
}

