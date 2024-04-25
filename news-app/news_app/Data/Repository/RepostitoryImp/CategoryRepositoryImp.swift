//
//  LocalCategoryRepositoryImp.swift
//  news_app
//
//  Created by user on 4/5/24.
//

import Foundation

class CategoryRepositoryImp : CategoryRepository {
    
    func getCategoriesBeShownByTypeSource(withTypeSource type : TypeSource, withUser user : User) -> [Category] {
        do {

            let arrCDCategory =  try CDCategory.getCDCategoryWithTypeSource(withTypeSource: type)
            let arr = DataMapper.MapCDCategoryToEntity(withTypeSource: type, withUser : user, cdCategory: arrCDCategory)
            let user = try DataMapper.MapCDUsertoEntity(withCDUser: CDUser.fetchUserById(idUser: user.idUser!) ?? CDUser() )

            var arrCategoryResult :[Category] = []
            for i in arr {
                user.listItemShow?[type.rawValue]?.forEach({ value in
                    if i.index == value {
                        arrCategoryResult.append(i)
                    }
                })
            }
            return arrCategoryResult

        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
    }

    func getAllCategoriesByTypeSource(withTypeSource type : TypeSource, withUser user : User) -> [Category] {
        do {
            
            let arr =  try CDCategory.getCDCategoryWithTypeSource(withTypeSource: type)
            return DataMapper.MapCDCategoryToEntity(withTypeSource: type, withUser : user, cdCategory: arr)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
        
    }
    func getAll() -> [Category] {
        do {
            let arr = try CDCategory.getAll()
            return DataMapper.MapCDCategoryToEntity(withCDCategory: arr)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
    }
    func getCategoryWithUUID(withUUIDs uuids : [UUID]) -> [Category] {
        do {
            let arr = try CDCategory.getCategory(withUUIDs: uuids)
            return DataMapper.MapCDCategoryToEntity(withCDCategory: arr)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return []
        }
    }
}
