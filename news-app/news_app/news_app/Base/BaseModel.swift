//
//  BaseModel.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation

class BaseModel  {
    func excuteTask(blockUI : Bool = false,
                    task : @escaping (()-> Void),
                    complete : @escaping (() -> Void)
    ) {
        if blockUI == true {
            DispatchQueue.main.async {
                
            }
        }
        DispatchQueue.global().async {
            task()
            DispatchQueue.main.async {
                complete()
            }
        }
    }
    
    func excuteNetwork<T>(blockUI : Bool = false,
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
}
