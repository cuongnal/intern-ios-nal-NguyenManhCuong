//
//  ImageCache.swift
//  news_app
//
//  Created by Manhcuong on 15/04/2024.
//

import Foundation

class ImageCache {
    class func getImageURLToCache(withURL string : String) {
        guard let url = URL(string: string) else {return}
        
        var urlRequest = URLRequest(url: url)
        if URLCache.shared.cachedResponse(for: urlRequest) != nil {
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response,err in
            guard (200...299).contains((response as! HTTPURLResponse).statusCode ), err != nil, let data = data,let response = response else {
                return
            }
            let cacheImage = CachedURLResponse(response: response , data: data)
            URLCache.shared.storeCachedResponse(cacheImage, for: urlRequest)
        }
    }
    class func setImageWithURL(withURL string : String) -> Data {
        guard let url = URL(string: string) else {return Data()}
        if let cacheImage = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return cacheImage.data
        }
        return Data()
    }
}
