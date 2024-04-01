//
//  HomeModel.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation
import Kingfisher
class HomeModel : BaseModel {
    var xmlParser = XMLParserToObject.getInstance()
    var arrNews : [News] = []
    func fetchDataNews(category : Category, updateView : @escaping (([News]) -> Void)) {
        excuteNetwork(
            task: { [weak self] in
                self?.xmlParser.callFromByUrl(category: category, result: {(arr) in
                    self?.arrNews.removeAll()
                    self?.arrNews.append(contentsOf: arr)
                    self?.getImageByUrl(arr: arr)
                })
            },
            complete: { [weak self] in
                guard let a = self?.arrNews else {return}
                updateView(a)
                
            }
        )
    }
    func getImageByUrl(arr: [News]) {
        for item in arr {
            if let url = URL(string: item.image) {
                KingfisherManager.shared.retrieveImage(with: url, options: nil) { result in}
            }
        }
    }
}

