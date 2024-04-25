//
//  SearchHomeViewController.swift
//  news_app
//
//  Created by Manhcuong on 22/04/2024.
//

import Foundation
import UIKit

class SearchBarHome : UISearchBar, UISearchBarDelegate {
    var onTouchCancelCallback : (() -> Void)?
    var onTextDidChangeCallback : ((String) -> Void)?
    private var timer : Timer?
    var isTextSearching =  false
    required init?(coder : NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        print("oke")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        isTextSearching = searchText.isEmpty ? false : true
        if searchText.isEmpty {
            onTextDidChangeCallback?("")
            return
        }
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) {[weak self] timer in
            
            self?.onTextDidChangeCallback?(searchText)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isTextSearching = false
        onTouchCancelCallback?()
    }
}
