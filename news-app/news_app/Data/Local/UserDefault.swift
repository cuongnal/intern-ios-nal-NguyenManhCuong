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
                TypeSource.vnExpress.rawValue : Array(0...20)]
    }
    
    func getValue<T : Decodable> (swiftClass type: T.Type, forKey : String ) -> T? where T : Decodable {
        if let data = self.data(forKey: forKey) {
            do {
                let value = try JSONDecoder().decode(type, from: data)
                return value
            }
            catch{
                return nil
            }
        }
        return nil
    }
    func setValue<T : Encodable>(withAnyObject value: T, key : String ) {
        do {
            let data = try JSONEncoder().encode(value)
            self.set(data, forKey: key)
        }
        catch {}
    }
}
