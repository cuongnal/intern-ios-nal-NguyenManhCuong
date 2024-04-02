//
//  WebViewModel.swift
//  news_app
//
//  Created by hiepnv1 on 02/04/2024.
//

import Foundation
class WebViewModel : BaseModel {
    
    func getDetailNews(newsItem : ItemRss?, callBack : @escaping ((URLRequest) -> ())) {
        guard let item = newsItem  else {
            return
        }
        excuteNetwork(task: {
            return URLRequest(url: URL(string: item.link)!, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 2.0)
        }, complete: { (data) in
            callBack(data)
        })
    }
}
