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
    var selectedItemCallback : ((TypeItemSelected) -> ())? = nil
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
        selectedItemCallback!(data[indexPath.row].type)
        self.deselectRow(at: indexPath, animated: false)
    }
    // enum này dùng để check loại item được click là loại nào, sẽ mở ra màn hình tương ứng loại đó
    enum TypeItemSelected {
        case account, languages, categories, logOut, user, changePassword
    }
    
    class func getSettingTableListItem() -> [(text: String, image: String, type: SettingTableView.TypeItemSelected)] {
        return [(text: LanguageManager.getText(withKey: KeyText.account),image: "ic_person", type :  TypeItemSelected.account),
                (text: LanguageManager.getText(withKey: KeyText.languages), image: "ic_question", type: .languages),
                (text: LanguageManager.getText(withKey: KeyText.categories), image: "ic_question", type: .categories),
                (text: LanguageManager.getText(withKey: KeyText.logOut), image: "ic_logout", type: .logOut)]
    }
    class func getAccountTableListItem () -> [(text: String, image: String, type: SettingTableView.TypeItemSelected)] {
        return [(text: UserDefaults.getUser()?.email ?? "",image: "ic_email", type: TypeItemSelected.user),
                (text: LanguageManager.getText(withKey: KeyText.changePassword),image: "ic_lock", type: .changePassword)]
    }
}
