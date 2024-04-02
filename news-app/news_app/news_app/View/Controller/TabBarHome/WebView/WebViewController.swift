//
//  WebViewController.swift
//  news_app
//
//  Created by hiepnv1 on 29/03/2024.
//

import Foundation
import UIKit
import WebKit
class WebViewController : UIViewController, WKNavigationDelegate {
    
    var newsItem : ItemRss? = nil
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var webKitView: WKWebView!
    var webViewModel = WebViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBarButton()
        webKitView.navigationDelegate = self
        loading.hidesWhenStopped = true
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        webViewModel.getDetailNews(newsItem: newsItem, callBack: { [weak self] data in
            self?.webKitView.load(data)
        })
    }
    func setUpBarButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back"),
                                                                style: .done,
                                                                target: self,
                                                                action: #selector(self.goBack))
        let btnRightFirst = UIBarButtonItem(image: UIImage(named: "ic_share"), style: .plain, target: self, action: #selector(sharingNewsToOther))
        let btnRightSecond = UIBarButtonItem(image: UIImage(named: "ic_bookmark"), style: .plain, target: nil, action: #selector(saveToBookmark))
        
        btnRightSecond.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ], for: .normal)
        
        btnRightSecond.customView?.isUserInteractionEnabled = false
        navigationItem.rightBarButtonItems = [btnRightFirst,btnRightSecond]
    }
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func sharingNewsToOther() {
        
    }
    @objc private func saveToBookmark() {
        
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        loading.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loading.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loading.stopAnimating()
    }
    
}
