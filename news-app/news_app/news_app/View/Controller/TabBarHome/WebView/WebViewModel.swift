//
//  WebViewModel.swift
//  news_app
//
//  Created by hiepnv1 on 02/04/2024.
//

import Foundation
class WebViewModel : BaseModel {
    let newsRepository = NewsRepositoryImp()
    
    func getDetailNews(newsItem : ItemRss?, callBack : @escaping ((URLRequest) -> ())) {
        excuteNetwork(task: { [weak self] in
            return self?.newsRepository.getNewsDetail(newsItem: newsItem)
        }, complete: { (data) in
            if let data = data {
                callBack(data)
            }
        })
    }
}
