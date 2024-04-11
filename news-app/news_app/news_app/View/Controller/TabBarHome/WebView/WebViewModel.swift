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
        self.newsRepository.insertNewsSeenWithUser(withUserLogin:UserDefaults.getUser()! , withNews: news)
//        excuteTask(task: { [weak self] in
//            self?.newsRepository.insertNewsSeenWithUser(withUserLogin:UserDefaults.getUser()! , withNews: news)
//        }, complete: {_ in})
    }
}
