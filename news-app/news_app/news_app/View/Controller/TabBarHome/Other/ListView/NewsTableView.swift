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
    var category : Category?
    var onTouchNewsCallback : ((News) -> ())!
    var openPopUp : ((News,UIView) -> ())!

    private var refresh : UIRefreshControl?
    var pullToRefreshCallback : ((Category) -> Void )?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        self.dataSource = self
        keyboardDismissMode = .onDrag
        self.refresh = UIRefreshControl()
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: Constant.NEWS_TABLE_VIEW_CELL, for: indexPath) as! NewsTableViewCell
        item.setUpView(item: data[indexPath.row])
        item.onTouchCallback = { [weak self] (itemNews, anchor) in
            self?.openPopUp?(itemNews, anchor)
        }
        return item
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onTouchNewsCallback(data[indexPath.item])
        self.deselectRow(at: indexPath, animated: false)
    }
    func pullToRefresh() {
        guard let refresh = refresh else{ return }
        self.alwaysBounceVertical = true
        refresh.tintColor = UIColor.red
        refresh.addTarget(self, action: #selector(loadData), for: .valueChanged)
        addSubview(refresh)
    }
    @objc func loadData() {
        guard let category = category else {return}
        self.refresh?.beginRefreshing()
        pullToRefreshCallback?(category)
    }
    
    func stopRefreshing() {
        self.refresh?.endRefreshing()
    }
}
