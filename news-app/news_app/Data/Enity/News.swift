//
//  News.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import UIKit
import CryptoKit
public class News : NSObject  {
    var idNews : String!
    var urlImage : String = ""
    @objc dynamic var image = UIImage()
    var title : String = ""
    var pubDate : String = ""
    var idCate : UUID!
    var author : String = Constant.VN_EXPRESS
    var typeCategory : String = "Trang chủ"
    var link : String = ""
    var des : String = ""
    func createPrimaryKey() {
        let inputData = Data((pubDate + title).utf8)
        let hashedData = SHA256.hash(data: inputData)
        idNews = hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
    init(idNews: String!, image: String, title: String, pubDate: String, idCate: UUID, author: String, typeCategory: String, link: String, description: String) {
        self.idNews = idNews
        self.urlImage = image
        self.title = title
        self.pubDate = pubDate
        self.idCate = idCate
        self.author = author
        self.typeCategory = typeCategory
        self.link = link
        self.des = description
    }
    override init() {}
}
public enum TypeSource : String {
    case vnExpress = "VN_EXPRESS"
    case tuoiTre = "TUOI_TRE"
}
