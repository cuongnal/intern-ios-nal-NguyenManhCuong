//
//  CategoriesUseCase.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class LocalCategoryUseCase {
    
    private var localUserRepository = LocalUsersRepositoryImp()
    private var localCategoryRepository = LocalCategoryRepositoryImp()
    
    func run(param: Param) -> [Category] {
        let user : CDUser? = localUserRepository.getUserDetail(idUser: param.idUser)
        let cdCategory : [CDCategory] = localCategoryRepository.getCategoriesByTypeSource()
        var arr : [Category] = []
        
        for i in stride(from: 0, to: user!.listIndexCategories![param.typeSource]!.count, by:1) {
            let indexCategory : Int = user!.listIndexCategories![param.typeSource]![i]
            var item : Category = Category()
            
            let tg = cdCategory.first(where: {$0.indexCategory == indexCategory})
            if let tg = tg {
                item.id = tg.idCate
                item.url = tg.url
                item.sourceType = tg.typeSource
                item.title = tg.title
                arr.append(item)
            }
        }
 
        return arr
    }
}
class Param {
    var data :(([Category]) -> ())?
    var idUser : String
    var typeSource : String
    init(data: ( ([Category]) -> Void)? = nil, idUser: String, typeSource: String) {
        self.data = data
        self.idUser = idUser
        self.typeSource = typeSource
    }
}
