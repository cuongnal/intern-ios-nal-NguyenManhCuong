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
    
    func updateUser(isHiddenCategories isHidden : Bool, callback : @escaping (()-> Void)) {
        excuteTask(task: { [weak self] in
            var user = UserDefaults.getUser()
            user?.hiddenCategories = isHidden
            guard let user = user else {return}
            UserDefaults.setUser(user: user)
            self?.userRepository.updateUser(user:user)
        }, complete: {_ in
            callback()
        })
    }
}
