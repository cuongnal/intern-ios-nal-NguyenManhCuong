//
//  LoadingViewController.swift
//  news_app
//
//  Created by user on 4/8/24.
//

import Foundation
import UIKit
class LoadingViewController : UIViewController {
    var loadingView : UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoadingView()
    }
    private func setLoadingView() {
        loadingView = UIActivityIndicatorView(style: .large)
        self.view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loadingView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.view.updateConstraintsIfNeeded()
        self.view.backgroundColor = UIColor.lightGray
        self.view.alpha = 0.4
        loadingView.hidesWhenStopped = true
        loadingView.startAnimating()
    }

}

