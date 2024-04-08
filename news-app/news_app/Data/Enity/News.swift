//
//  News.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import UIKit
import CryptoKit
struct News {
    var idNews : String!
    var image : String = ""
    var title : String = ""
    var pubDate : String = ""
    var idCategory : UUID!
    var author : String = Constant.VN_EXPRESS
    var typeCategory : String = "Trang chủ"
    var link : String = ""
    var description : String = ""
    mutating func createPrimaryKey() {
        let inputData = Data((pubDate + title).utf8)
        let hashedData = SHA256.hash(data: inputData)
        idNews = hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
    init(idNews: String!, image: String, title: String, pubDate: String, idCategory: UUID, author: String, typeCategory: String, link: String, description: String) {
        self.idNews = idNews
        self.image = image
        self.title = title
        self.pubDate = pubDate
        self.idCategory = idCategory
        self.author = author
        self.typeCategory = typeCategory
        self.link = link
        self.description = description
    }
    init() {}
}
enum TypeSourceNews : String {
    case vnExpress = "VN_EXPRESS"
    case tuoiTre = "TUOI_TRE"
}
