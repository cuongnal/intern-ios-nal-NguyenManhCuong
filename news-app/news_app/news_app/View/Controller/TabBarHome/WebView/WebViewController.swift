//
//  WebViewController.swift
//  news_app
//
//  Created by hiepnv1 on 29/03/2024.
//

import Foundation
import UIKit
import WebKit
class WebViewController : BaseViewController, WKNavigationDelegate {
    
    var newsItem : News? = nil
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var webKitView: WKWebView!
    var webModel = WebModel(newsRepository: NewsRepositoryImp() )
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webKitView.navigationDelegate = self
        loading.hidesWhenStopped = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        guard let item = newsItem, let url = URL(string: item.link) else {return}
        
        webModel.isBookmarkUser(withNews: item, callback: { [weak self](isCheck) in
            self?.setUpBarButton(isCheckBookmarked: isCheck)
        })
        self.webKitView.load (URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 5.0))
    }
    func setUpBarButton(isCheckBookmarked : Bool) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_back"),
                                                                style: .done,
                                                                target: self,
                                                                action: #selector(self.goBack))
        let btnShare = UIBarButtonItem(image: UIImage(named: "ic_share"),
                                       style: .plain,
                                       target: self,
                                       action: #selector(sharingNewsToOther))
        
        let btnBookmark = UIBarButtonItem(image: UIImage(named: isCheckBookmarked ? "ic_bookmarked" : "ic_bookmark"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(saveToBookmark))
        
        btnBookmark.setTitleTextAttributes([
            .font: UIFont.systemFont(ofSize: 17, weight: .bold),
            .foregroundColor : UIColor.black
        ], for: .normal)
        
        btnBookmark.customView?.isUserInteractionEnabled = false
        navigationItem.rightBarButtonItems = [btnShare,btnBookmark]
    }
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func sharingNewsToOther() {
        
    }
    @objc private func saveToBookmark() {
        if !webModel.isCheckBookmarked {
            webModel.saveBookmark(withNews: newsItem!)
            setUpBarButton(isCheckBookmarked: true)
            showToast(text: Constant.SAVED_BOOKMARK)
        }
        else {
           
        }
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        loading.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loading.startAnimating()
        guard let newsItem = newsItem else {
            return
        }
        webModel.saveNews(withNews: newsItem)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loading.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // loading.stopAnimating()
    }
}
