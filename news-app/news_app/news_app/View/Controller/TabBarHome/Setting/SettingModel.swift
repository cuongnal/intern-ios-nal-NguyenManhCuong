//
//  SettingModel.swift
//  news_app
//
//  Created by Manhcuong on 24/04/2024.
//

import Foundation
import FirebaseAuth
class SettingModel : BaseModel {
    var userRepository : UsersRepository = UsersRepositoryImp()
    var categoryRepository : CategoryRepository = CategoryRepositoryImp()
    func logOutEmail(callback : (() -> Void )) {
        delegate?.startLoading()
        do {
            try Auth.auth().signOut()
            callback()
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            callback()
        }
        delegate?.cancelLoading()
    }
    
    //    func updateUser(isHiddenCategories isHidden : Bool, callback : @escaping (()-> Void)) {
    //        excuteTask(task: { [weak self] in
    //            var user = UserDefaults.getUser()
    //            user?.hiddenCategories = isHidden
    //            guard let user = user else {return}
    //            UserDefaults.setUser(user: user)
    //            self?.userRepository.updateUser(user:user)
    //        }, complete: {_ in
    //            callback()
    //        })
    //    }
    
    func getCategory(typeSource : TypeSource, callBackArrCategory : @escaping( ([Category],[Int]) -> Void)) {
        excuteTask(task: { [weak self] in
            let arrCate = self?.categoryRepository.getAllCategoriesByTypeSource(withTypeSource: typeSource, withUser: UserDefaults.getUser()!)
            let user = self?.userRepository.getUserDetail(idUser: UserDefaults.getUser()!.idUser!)
            var arrInt : [Int] = []
            
            arrInt.append(contentsOf: user?.listItemShow?[typeSource.rawValue] ?? [])
    
            return (arrCate ?? [], arrInt)
        }, complete: { tuple in
            callBackArrCategory(tuple?.0 ?? [], tuple?.1 ?? [])
        })
    }
    func updateListShowCategories(withListIndex listIndex : [Int], typeSource : TypeSource, callBack  : @escaping ( () -> Void)) {
        excuteTask { [weak self] in
            let user = UserDefaults.getUser()
            guard var user = user else {return}
            user.listItemShow?[typeSource.rawValue] = listIndex
            UserDefaults.setUser(user: user)
            self?.userRepository.updateUser(user:user)
        } complete: { _ in
            callBack()
        }

    }
    
}
