//
//  ImageCache.swift
//  news_app
//
//  Created by Manhcuong on 17/04/2024.
//

import Foundation
import UIKit

class ImageCache  {
    private class func getFolderImageNews() -> URL {
        let dirPaths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = dirPaths[0].appendingPathComponent("ImageNews")
        return path
    }

    class func createFolderImageNews () {
        do {
            try FileManager.default.createDirectory(at: getFolderImageNews(), withIntermediateDirectories: true)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
        }
    }
    
    class func insertImage(withDataImage data : Data, idNews : String) {
        if !FileManager.default.fileExists(atPath: getFolderImageNews().path) {
            createFolderImageNews()
        }
        do {
            let imageURL = getFolderImageNews().appendingPathComponent("\(idNews).dat")
            try data.write(to: imageURL)
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
        }
    }
    class func getImage(idNews : String) -> UIImage? {
        
        if !FileManager.default.fileExists(atPath: getFolderImageNews().path) {return nil}
        
        let path = getFolderImageNews().appendingPathComponent("\(idNews).dat")
        do {
            return try UIImage(data: Data(contentsOf: path))
        }
        catch let err {
            print("Function:   \(#function)   line: \(#line)   error: \(err)")
            return nil
        }
    }
}
