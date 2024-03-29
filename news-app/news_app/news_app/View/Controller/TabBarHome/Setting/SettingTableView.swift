//
//  SettingTableView.swift
//  news_app
//
//  Created by hiepnv1 on 28/03/2024.
//

import Foundation
import UIKit
class SettingTableView : UITableView, UITableViewDataSource, UITableViewDelegate {
    var data : [(text: String, image: String, type: TypeItemSelected)] = []
    var callBack : ((TypeItemSelected) -> ())? = nil
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.delegate = self
        self.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: Constant.SETTING_TABLE_VIEW_CELLS, for: indexPath) as! SettingTableViewCell
        item.setDataCell(item: data[indexPath.row])
        if(data[indexPath.row].type == .user || data[indexPath.row].type == .logOut) {
            item.accessoryType = .none
        }
        return item
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callBack!(data[indexPath.row].type)
    }
    // enum này dùng để check loại item được click là loại nào, sẽ mở ra màn hình tương ứng loại đó
    public enum TypeItemSelected {
        case account, languages, categories, logOut, user, changePassword
    }
    
    static let SETTING_TABLE_LIST_ITEM = [(text: "Account",image: "ic_person", type : TypeItemSelected.account),
                                          (text: "Languages", image: "ic_question", type: .languages),
                                          (text: "Categories management", image: "ic_question", type: .categories),
                                          (text: "Log out", image: "ic_logout", type: .logOut)]
    
    static let ACCOUNT_TABLE_LIST_ITEM = [(text: "email@email.com",image: "ic_email", type: TypeItemSelected.user),
                                          (text: "Change password",image: "ic_lock", type: .changePassword)]
}
