//
//  File.swift
//  news_app
//
//  Created by hiepnv1 on 18/03/2024.
//

import Foundation
import UIKit

struct Constant {
    static let IC_PASSWORD_VISIBLE : String = "ic_visibility"
    static let IC_PASSWORD_VISIBLE_OFF : String = "ic_visibility_off"
    static let COLOR_SIGN_UP_GRAY = UIColor.init(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
    static let COLOR_BLACK = UIColor.black
    static let COLOR_WHITE = UIColor.white
    static let HOME_COLLECTION_VIEW_CELLS =  "HomeCollectionViewCells"
    static let HOME_TABLE_VIEW_CELLS = "HomeTableViewCells"

    static let VN_EXPRESS = [
        Category(id: 0, title: "Trang chủ", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.HOME),
        Category(id: 1, title: "Thế giới", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.WORLD),
        Category(id: 2, title: "Thời sự", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.NEWS),
        Category(id: 3, title: "Kinh doanh", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.BUSINESS),
        Category(id: 4, title: "Startup", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.STARTUP),
        Category(id: 5, title: "Giải trí", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.ENTERTAINMENT),
        Category(id: 6, title: "Thể thao", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.SPORT),
        Category(id: 7, title: "Pháp luật", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.LAW),
        Category(id: 8, title: "Giáo dục", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.EDUCATION),
        Category(id: 9, title: "Tin mới nhất", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.LATES_NEWS),
        Category(id: 10, title: "Tin nổi bật", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.HOT_NEWS),
        Category(id: 11, title: "Sức khỏe", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.HEALTH),
        Category(id: 12, title: "Đời sống", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.LIFE),
        Category(id: 13, title: "Du lịch", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.TRAVEL),
        Category(id: 14, title: "Khoa học", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.SCIENCE),
        Category(id: 15, title: "Số hóa", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.DIGITAL),
        Category(id: 16, title: "Xe", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.CAR),
        Category(id: 17, title: "Ý kiến", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.OPINION),
        Category(id: 18, title: "Tâm sự", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.CONFESSION),
        Category(id: 19, title: "Cười", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.JOKE),
        Category(id: 20, title: "Tin xem nhiều", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.MOST_VIEWED)
    ]
    
    static let TUOI_TRE = [
        Category(id: 0, title: "Trang chủ", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.HOME),
        Category(id: 1, title: "Thời sự", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.NEWS),
        Category(id: 2, title: "Thế giới", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.WORLD),
        Category(id: 3, title: "Pháp luật", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.LAW),
        Category(id: 4, title: "Kinh doanh", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.BUSINESS),
        Category(id: 5, title: "Công nghệ", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.TECHNOLOGY),
        Category(id: 6, title: "Xe", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.CAR),
        Category(id: 7, title: "Nhịp sống trẻ", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.YOUTH_LIFE),
        Category(id: 8, title: "Văn hóa", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.CULTURE),
        Category(id: 9, title: "Giải trí", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.ENTERTAINMENT),
        Category(id: 10, title: "Thể thao", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.SPORT),
        Category(id: 11, title: "Giáo dục", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.EDUCATION),
        Category(id: 12, title: "Khoa học", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.SCIENCE),
        Category(id: 13, title: "Sức khỏe", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.HEALTH),
        Category(id: 14, title: "Giả thật", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.FAKE_NEWS),
        Category(id: 15, title: "Thư giãn", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.RELAX),
        Category(id: 16, title: "Bạn đọc làm báo", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.READERS_AS_REPORTER),
        Category(id: 17, title: "Du lịch", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.TRAVEL)
    ]

}
