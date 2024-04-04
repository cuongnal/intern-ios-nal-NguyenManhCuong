//
//  HomeModel.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation
//import Kingfisher
class HomeModel : BaseModel {
    let newsRepository = RemoteNewsRepositoryImp()
    var arrNews : [ItemRss] = []
    
    func fetchDataNews(category : Category, callBack : @escaping (([ItemRss]) -> Void)) {
        excuteNetwork(
            task: { [weak self] in
                let arr =  self?.newsRepository.getNewsByTypeCategory(category: category)
                self?.arrNews.removeAll()
                self?.arrNews.append(contentsOf: arr ?? [])
            },
            complete: { [weak self] _ in
                guard let arr = self?.arrNews else {return}
                callBack(arr)
            }
        )
    }
}

