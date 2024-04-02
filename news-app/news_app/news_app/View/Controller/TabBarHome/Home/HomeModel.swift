//
//  HomeModel.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation
//import Kingfisher
class HomeModel : BaseModel {
    var xmlParser = XMLParserToObject.getInstance()
    var arrNews : [ItemRss] = []
    func fetchDataNews(category : Category, callBack : @escaping (([ItemRss]) -> Void)) {
        excuteNetwork(
            task: { [weak self] in
                self?.xmlParser.callFromByUrl(category: category, result: {(arr) in
                    self?.arrNews.removeAll()
                    self?.arrNews.append(contentsOf: arr)
                    self?.getImageByUrl(arr: arr)
                })
            },
            complete: { [weak self] in
                guard let arr = self?.arrNews else {return}
                callBack(arr)
            }
        )
    }
    func getImageByUrl(arr: [ItemRss]) {
        for item in arr {
            if let url = URL(string: item.image) {
           //     KingfisherManager.shared.retrieveImage(with: url, options: nil) { result in}
            }
        }
    }
}

