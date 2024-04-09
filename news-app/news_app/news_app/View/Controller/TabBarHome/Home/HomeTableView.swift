//
//  HomeTableView.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import UIKit
class HomeTableView : UITableView, UITableViewDataSource, UITableViewDelegate {
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
        let item = tableView.dequeueReusableCell(withIdentifier: Constant.HOME_TABLE_VIEW_CELLS, for: indexPath) as! HomeTableViewCell
        item.setUpView(item: data[indexPath.row])
        return item
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callBack(data[indexPath.item])
        self.deselectRow(at: indexPath, animated: false)
    }
    func setUpHomeTableView(arrNews: [News]) {
        if data.count != 0 {
            self.data.removeAll()
        }
        self.data.append(contentsOf: arrNews)
        self.reloadData()
    }
    
}
