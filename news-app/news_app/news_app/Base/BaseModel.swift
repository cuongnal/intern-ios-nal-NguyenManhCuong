//
//  BaseModel.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation

protocol BaseModelDelegate{
    func startLoading()
    func cancelLoading()
}
class BaseModel  {
    var delegate : BaseViewController?
    
    class func saveBookmark(withNews news : News) {
        NewsRepositoryImp().insertNewsToBookmark(withNews: news, withUserLogin: UserDefaults.getUser()!)
    }
    func excuteTask<T>(blockUI : Bool = false,
                       task : @escaping (()-> T?),
                       complete : @escaping ((T?) -> Void)
    ) {
        if blockUI == true {
            DispatchQueue.main.async {
                
            }
        }
        DispatchQueue.global().async {
            let result = task()
            DispatchQueue.main.async {
                complete(result)
            }
        }
    }
    
    func excuteNetwork<T>(blockUI : Bool = false,
                          task : @escaping (()-> T?),
                          complete : @escaping ((T?) -> Void)
    ) {
        if blockUI == true {
            DispatchQueue.main.async {
                self.delegate?.startLoading()
            }
        }
        DispatchQueue.global().async {
            let result = task()
            DispatchQueue.main.async {
                self.delegate?.cancelLoading()
                complete(result)
            }
        }
    }
}
