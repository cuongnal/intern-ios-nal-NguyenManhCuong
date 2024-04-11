//
//  NewsTableView.swift
//  news_app
//
//  Created by user on 4/11/24.
//

import Foundation
import UIKit
class NewsTableView : UITableView, UITableViewDataSource, UITableViewDelegate {
    var data : [News] = []
    var callBack : ((News) -> ())!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        self.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: Constant.NEWS_TABLE_VIEW_CELL, for: indexPath) as! NewsTableViewCell
        item.setUpView(item: data[indexPath.row])
        return item
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callBack(data[indexPath.item])
        self.deselectRow(at: indexPath, animated: false)
    }
    
}
