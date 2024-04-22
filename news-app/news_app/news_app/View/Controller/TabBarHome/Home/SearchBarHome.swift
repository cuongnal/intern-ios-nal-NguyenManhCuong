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
    var onTextDidChangeCallback : (([String]) -> Void)?
    private var timer : Timer?
    required init?(coder : NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        print("oke")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        if searchText.isEmpty {
            onTextDidChangeCallback?([])
            return
        }
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) {[weak self] timer in
            
            let arrText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
            self?.onTextDidChangeCallback?(arrText)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        onTouchCancelCallback?()
    }
}
