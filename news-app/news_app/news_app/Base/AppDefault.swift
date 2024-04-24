//
//  AppDefault.swift
//  news_app
//
//  Created by Manhcuong on 23/04/2024.
//

import Foundation

struct AppDefault {
    static let CATEGORY_VN_EXPRESS = [
        Category(idCate: UUID(), title: "Trang chủ", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.HOME,typeSource: TypeSource.vnExpress.rawValue,index: 0),
        Category(idCate: UUID(), title: "Thế giới", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.WORLD,typeSource: TypeSource.vnExpress.rawValue,index: 1),
        Category(idCate: UUID(), title: "Thời sự", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.NEWS,typeSource: TypeSource.vnExpress.rawValue,index: 2),
        Category(idCate: UUID(), title: "Kinh doanh", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.BUSINESS,typeSource: TypeSource.vnExpress.rawValue,index: 3),
        Category(idCate: UUID(), title: "Startup", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.STARTUP,typeSource: TypeSource.vnExpress.rawValue,index: 4),
        Category(idCate: UUID(), title: "Giải trí", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.ENTERTAINMENT,typeSource: TypeSource.vnExpress.rawValue,index: 5),
        Category(idCate: UUID(), title: "Thể thao", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.SPORT,typeSource: TypeSource.vnExpress.rawValue,index: 6),
        Category(idCate: UUID(), title: "Pháp luật", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.LAW,typeSource: TypeSource.vnExpress.rawValue,index: 7),
        Category(idCate: UUID(), title: "Giáo dục", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.EDUCATION,typeSource: TypeSource.vnExpress.rawValue,index: 8),
        Category(idCate: UUID(), title: "Tin mới nhất", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.LATES_NEWS,typeSource: TypeSource.vnExpress.rawValue,index: 9),
        Category(idCate:  UUID(), title: "Tin nổi bật", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.HOT_NEWS,typeSource: TypeSource.vnExpress.rawValue,index: 10),
        Category(idCate:  UUID(), title: "Sức khỏe", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.HEALTH,typeSource: TypeSource.vnExpress.rawValue,index: 11),
        Category(idCate:  UUID(), title: "Đời sống", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.LIFE,typeSource: TypeSource.vnExpress.rawValue,index: 12),
        Category(idCate:  UUID(), title: "Du lịch", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.TRAVEL,typeSource: TypeSource.vnExpress.rawValue,index: 13),
        Category(idCate:  UUID(), title: "Khoa học", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.SCIENCE,typeSource: TypeSource.vnExpress.rawValue,index: 14),
        Category(idCate:  UUID(), title: "Số hóa", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.DIGITAL,typeSource: TypeSource.vnExpress.rawValue,index: 15),
        Category(idCate:  UUID(), title: "Xe", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.CAR,typeSource: TypeSource.vnExpress.rawValue,index: 16),
        Category(idCate:  UUID(), title: "Ý kiến", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.OPINION,typeSource: TypeSource.vnExpress.rawValue,index: 17),
        Category(idCate:  UUID(), title: "Tâm sự", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.CONFESSION,typeSource: TypeSource.vnExpress.rawValue,index: 18),
        Category(idCate:  UUID(), title: "Cười", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.JOKE,typeSource: TypeSource.vnExpress.rawValue,index: 19),
        Category(idCate:  UUID(), title: "Tin xem nhiều", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.MOST_VIEWED,typeSource: TypeSource.vnExpress.rawValue,index: 20)
    ]
    
    static let CATEGORY_TUOI_TRE = [
        Category(idCate: UUID(), title: "Trang chủ", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.HOME,typeSource:
                    TypeSource.tuoiTre.rawValue,index: 0),
        Category(idCate: UUID(), title: "Thời sự", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.NEWS,typeSource:
                    TypeSource.tuoiTre.rawValue,index: 1),
        Category(idCate: UUID(), title: "Thế giới", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.WORLD,typeSource:
                    TypeSource.tuoiTre.rawValue,index: 2),
        Category(idCate: UUID(), title: "Pháp luật", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.LAW,typeSource:
                    TypeSource.tuoiTre.rawValue,index: 3),
        Category(idCate: UUID(), title: "Kinh doanh", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.BUSINESS,typeSource: TypeSource.tuoiTre.rawValue,index: 4),
        Category(idCate: UUID(), title: "Công nghệ", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.TECHNOLOGY,typeSource: TypeSource.tuoiTre.rawValue,index: 5),
        Category(idCate: UUID(), title: "Xe", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.CAR,typeSource:
                    TypeSource.tuoiTre.rawValue,index: 6),
        Category(idCate: UUID(), title: "Nhịp sống trẻ", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.YOUTH_LIFE,typeSource: TypeSource.tuoiTre.rawValue,index: 7),
        Category(idCate: UUID(), title: "Văn hóa", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.CULTURE,typeSource: TypeSource.tuoiTre.rawValue,index: 8),
        Category(idCate: UUID(), title: "Giải trí", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.ENTERTAINMENT,typeSource: TypeSource.tuoiTre.rawValue,index: 9),
        Category(idCate:  UUID(), title: "Thể thao", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.SPORT,typeSource: TypeSource.tuoiTre.rawValue,index: 10),
        Category(idCate:  UUID(), title: "Giáo dục", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.EDUCATION,typeSource: TypeSource.tuoiTre.rawValue,index: 11),
        Category(idCate:  UUID(), title: "Khoa học", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.SCIENCE,typeSource: TypeSource.tuoiTre.rawValue,index: 12),
        Category(idCate:  UUID(), title: "Sức khỏe", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.HEALTH,typeSource: TypeSource.tuoiTre.rawValue,index: 13),
        Category(idCate:  UUID(), title: "Giả thật", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.FAKE_NEWS,typeSource: TypeSource.tuoiTre.rawValue,index: 14),
        Category(idCate:  UUID(), title: "Thư giãn", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.RELAX,typeSource: TypeSource.tuoiTre.rawValue,index: 15),
        Category(idCate:  UUID(), title: "Bạn đọc làm báo", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.READERS_AS_REPORTER,typeSource: TypeSource.tuoiTre.rawValue,index: 16),
        Category(idCate:  UUID(), title: "Du lịch", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.TRAVEL,typeSource: TypeSource.tuoiTre.rawValue,index: 17)
    ]
    
}
