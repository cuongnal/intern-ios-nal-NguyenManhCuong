//
//  LocalCategoriesRepository.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

protocol LocalCategoriesRepository {
    func getCategoriesByTypeSource() -> [CDCategory]
}
