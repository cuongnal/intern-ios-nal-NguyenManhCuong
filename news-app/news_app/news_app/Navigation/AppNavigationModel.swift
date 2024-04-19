//
//  AppNavigationModel.swift
//  news_app
//
//  Created by user on 4/12/24.
//

import Foundation

class AppNavigationModel : BaseModel {
    
    private var newsRepository = NewsRepositoryImp()
    
    func importDataDefault() {
        
        do {
            var arr : [CDCategory] = []
            let item :[CDCategory] = try AppDelegate.context.fetch(CDCategory.fetchRequest())
            if item.count == 0 {
                for (_, item) in Constant.CATEGORY_VN_EXPRESS.enumerated() {
                    let i = CDCategory(context: AppDelegate.context)
                    i.indexCategory = Int64(item.index)
                    i.title = item.title
                    i.url = item.url
                    i.idCate = item.idCate
                    i.typeSource = item.typeSource
                    arr.append(i)
                }
                for (_, item) in Constant.CATEGORY_TUOI_TRE.enumerated() {
                    let i = CDCategory(context: AppDelegate.context)
                    i.indexCategory = Int64(item.index)
                    i.title = item.title
                    i.url = item.url
                    i.idCate = item.idCate
                    i.typeSource = item.typeSource
                    arr.append(i)
                }
                try AppDelegate.context.save()
                
                let repoNews = NewsRepositoryImp()
                
                self.getNewsFromServer(repoNews: repoNews, completionHandler: { arr in
                    _ = repoNews.insertNewsByCategory(arrNews: arr)
                })
            }
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
        }
    }
    private func getNewsFromServer(repoNews: NewsRepositoryImp ,completionHandler: @escaping (([News]) -> ())) {
        excuteNetwork(task: {
            let vnExpressNews = repoNews.getAllNewsFromServerSource(typeSource: .vnExpress)
            let tuoiTreNews = repoNews.getAllNewsFromServerSource(typeSource: .tuoiTre)
            return  vnExpressNews + tuoiTreNews
        }, complete: {(arr) in
            completionHandler(arr!)
        })
        
    }
}

// 
