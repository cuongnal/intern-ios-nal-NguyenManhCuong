//
//  HomeTableView.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import UIKit
class HomeTableView : UITableView, UITableViewDataSource, UITableViewDelegate {
    var data : [News] = []
    init(frame: CGRect, data: [News]) {
        self.data = data
        super.init(frame: frame,style: UITableView.Style.grouped)
        self.delegate = self
        self.dataSource = self
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: Constant.HOME_TABLE_VIEW_CELLS, for: indexPath) as! HomeTableViewCell
        
        item.setUpView(item: data[indexPath.row])
        return item
    }
    
    
}
