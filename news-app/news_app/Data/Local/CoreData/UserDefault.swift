//
//  UserDefault.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//

import Foundation

extension UserDefaults {
    public static func setUser(user : User) {
        do {
            let data = try JSONEncoder().encode(user)
            self.standard.set(data, forKey: Constant.Key.USER_LOGIN)
        }
        catch {}
    }
    public static func getUser() -> User? {
        if let data = self.standard.data(forKey: Constant.Key.USER_LOGIN) {
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                return user
            }
            catch{}
        }
        return nil
    }
    public func setIndexCategoryDefault()  -> [String:[Int]]{
        return [TypeSource.tuoiTre.rawValue : Array(0...17),
                TypeSource.vnExpress.rawValue : [20,15,14,3,16,6,5,4,8,9,10,11,12,13,0,21,17,7,18,19,1,2] ]
    }
//    static func getValue<T> (_ type: T.Type, forKey : String ) -> T? where T : Decodable {
//        if let data = self.standard.data(forKey: forKey) {
//            
//            do {
//                let user = try JSONDecoder().decode(User.self, from: data)
//                return user
//            }
//            catch{
//                return nil
//            }
//        }
//    }
    
}


