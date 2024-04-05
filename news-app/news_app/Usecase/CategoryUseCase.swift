//
//  CategoriesUseCase.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class CategoryUseCase {
    
    private var localUserRepository = LocalUsersRepositoryImp()
    private var localCategoryRepository = LocalCategoryRepositoryImp()
    
    func run(param: Param) -> [Category] {
        let user : CDUser? = localUserRepository.getUserDetail(idUser: param.idUser)
        let cdCategory : [CDCategory] = localCategoryRepository.getCategoriesByTypeSource()
        var arr : [Category] = []
        
        
        for i in stride(from: 0, to: user!.listIndexCategories![param.typeSource]!.count, by:1) {
            let indexCategory = user!.listIndexCategories![param.typeSource]![i]
            var itemCategory : Category = Category()
            
            let tg = cdCategory.first(where: {$0.idCategory == indexCategory})
            if let tg = tg {
                itemCategory.id = Int(tg.idCategory)
                itemCategory.url = tg.url
                itemCategory.sourceType = tg.typeSource
                itemCategory.title = tg.title
                arr.append(itemCategory)
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
