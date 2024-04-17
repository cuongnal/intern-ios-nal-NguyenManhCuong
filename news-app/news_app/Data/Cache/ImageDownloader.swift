//
//  ImageCache.swift
//  news_app
//
//  Created by Manhcuong on 15/04/2024.
//

import Foundation
import UIKit

fileprivate let queue = DispatchQueue(label: "ImageDownloaderQueue", attributes: .concurrent, autoreleaseFrequency: .workItem)
class ImageDownloader {
    
    var task : URLSessionDataTask!
    
    func setImage(news : News, callBackDataImage : @escaping ((News,UIImage?) -> Void)) {
        queue.async { [self] in
            if let data = ImageCache.getImage(idNews: news.idNews){
                callBackDataImage(news, data)
                return
            }
            
            guard let url = URL(string: news.urlImage) else {return}
            
            task = URLSession.shared.dataTask(with: URLRequest(url: url)) {(data, response, error) in
                guard let response = response,
                      (200...299).contains((response as! HTTPURLResponse).statusCode ),
                      error == nil, let data = data else {
                    callBackDataImage(news,nil)
                    print("API_IMAGE:   \(#function)   line: \(#line)   error: \(String(describing: error))")
                    return
                }
                guard let uiImage = UIImage(data: data) else {return}
                
                callBackDataImage(news,uiImage)
                ImageCache.insertImage(withDataImage: data, idNews: news.idNews)
            }
            task.resume()
        }
    }
    
}
