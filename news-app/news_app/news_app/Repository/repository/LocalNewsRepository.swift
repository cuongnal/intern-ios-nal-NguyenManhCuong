//
//  LocalNewsRepository.swift
//  news_app
//
//  Created by admin1 on 4/4/24.
//

import Foundation

protocol LocalNewsRepository {
    func getNewsByTypeCategory(category : Category ) -> [ItemRss]

}
