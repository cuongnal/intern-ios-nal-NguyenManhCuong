//
//  HomeModel.swift
//  news_app
//
//  Created by hiepnv1 on 01/04/2024.
//

import Foundation
//import Kingfisher
class HomeModel : BaseModel {
    let newsRepository = RemoteNewsRepositoryImp()
    var arrNews : [News] = []
    var categoryUseCase = LocalCategoryUseCase()
    func fetchDataNews(category : Category, callBack : @escaping (([News]) -> Void)) {
        excuteNetwork(
            task: { [weak self] in
                let arr =  self?.newsRepository.getNewsByTypeCategory(category: category)
                self?.arrNews.removeAll()
                self?.arrNews.append(contentsOf: arr ?? [])
            },
            complete: { [weak self] _ in
                guard let arr = self?.arrNews else {return}
                callBack(arr)
            }
        )
    }
    func getCategoryByUser(idUser : String, typeSource : TypeClickPopover, callBack : @escaping (([Category]) -> Void) ) {
        let type = typeSource == .vnExpress ? Constant.Key.KEY_TYPE_VN_EXPRESS : Constant.Key.KEY_TYPE_TUOI_TRE
        excuteTask(
            task: {[weak self] in
                return self!.categoryUseCase.run(param: Param(idUser: idUser, typeSource: type))},
            complete: { (arrCategory) in
                callBack(arrCategory!)
            })
    }
    
}

