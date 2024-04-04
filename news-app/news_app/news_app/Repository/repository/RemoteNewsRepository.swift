//
//  NewsByType.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//

import Foundation
import UIKit

protocol RemoteNewsRepository {
    func getNewsByTypeCategory(category : Category ) -> [ItemRss]

 //   func getNewsDetail(newsItem : ItemRss?) -> URLRequest?
}
