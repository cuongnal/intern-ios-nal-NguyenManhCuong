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
    weak var delegate : BaseViewController?
    
    func excuteTask<T>(blockUI : Bool = false,
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
