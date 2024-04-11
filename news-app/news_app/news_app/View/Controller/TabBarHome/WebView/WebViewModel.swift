//
//  WebViewModel.swift
//  news_app
//
//  Created by hiepnv1 on 02/04/2024.
//

import Foundation
class WebViewModel : BaseModel {
    let newsRepository = NewsRepositoryImp()
    
    func saveNews(withNews news : News) {
        self.newsRepository.insertNewsSentWithUser(withUserLogin:UserDefaults.getUser()! , withNews: news)
    }
}
