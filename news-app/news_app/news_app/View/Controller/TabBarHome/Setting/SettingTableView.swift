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
    var callback : ((TypeItemSelected) -> ())? = nil
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
        callback!(data[indexPath.row].type)
        self.deselectRow(at: indexPath, animated: false)
    }
    // enum này dùng để check loại item được click là loại nào, sẽ mở ra màn hình tương ứng loại đó
    public enum TypeItemSelected {
        case account, languages, categories, logOut, user, changePassword
    }
    
    static let SETTING_TABLE_LIST_ITEM = [(text: LanguageManager.setText(withKey: KeyText.ACCOUNT),image: "ic_person", type : TypeItemSelected.account),
                                          (text: LanguageManager.setText(withKey: KeyText.LANGUAGES), image: "ic_question", type: .languages),
                                          (text: LanguageManager.setText(withKey: KeyText.CATEGORIES), image: "ic_question", type: .categories),
                                          (text: LanguageManager.setText(withKey: KeyText.LOG_OUT), image: "ic_logout", type: .logOut)]
    
    static let ACCOUNT_TABLE_LIST_ITEM = [(text: UserDefaults.getUser()?.email ?? "",image: "ic_email", type: TypeItemSelected.user),
                                          (text: LanguageManager.setText(withKey: KeyText.CHANGE_PASSWORD),image: "ic_lock", type: .changePassword)]
}
