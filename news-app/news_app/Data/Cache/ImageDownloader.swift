//
//  ImageCache.swift
//  news_app
//
//  Created by Manhcuong on 15/04/2024.
//

import Foundation
import UIKit

class ImageDownloader {
    var task : URLSessionDataTask!
    
    func setImage(news : News, callBackDataImage : @escaping ((UIImage?) -> Void)) {
        DispatchQueue.global().async { [self] in
            
            if let data = ImageCache.getImage(idNews: news.idNews){
                callBackDataImage(data)
                return
            }
            
            guard let url = URL(string: news.urlImage) else {return}
            
            task = URLSession.shared.dataTask(with: URLRequest(url: url)) {(data, response, error) in
                guard let response = response,
                      (200...299).contains((response as! HTTPURLResponse).statusCode ),
                      error == nil, let data = data else {
                    callBackDataImage(nil)
                    print("API_IMAGE:   \(#function)   line: \(#line)   error: \(String(describing: error))")
                    return
                }
                guard let uiImage = UIImage(data: data) else {return}
                
                callBackDataImage(uiImage)
                ImageCache.insertImage(withDataImage: data, idNews: news.idNews)
            }
            task.resume()
        }
    }
    
}
