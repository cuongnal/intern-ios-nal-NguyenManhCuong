//
//  Api.swift
//  news_app
//
//  Created by hiepnv1 on 25/03/2024.
//

import Foundation
struct Api {
    static let BASE_URL_TUOITRE = "https://tuoitre.vn"
    static let BASE_URL_VNEXPRESSS = "https://vnexpress.net"
    struct Vnexpress {
        static let HOME = "/rss/tin-moi-nhat.rss"
        static let WORLD = "/rss/the-gioi.rss"
        static let NEWS = "/rss/thoi-su.rss"
        static let BUSINESS = "/rss/kinh-doanh.rss"
        static let STARTUP = "/rss/startup.rss"
        static let ENTERTAINMENT = "/rss/giai-tri.rss"
        static let SPORT = "/rss/the-thao.rss"
        static let LAW = "/rss/phap-luat.rss"
        static let EDUCATION = "/rss/giao-duc.rss"
        static let LATES_NEWS = "/rss/tin-moi-nhat.rss"
        static let HOT_NEWS = "/rss/tin-noi-bat.rss"
        static let HEALTH = "/rss/suc-khoe.rss"
        static let LIFE = "/rss/doi-song.rss"
        static let TRAVEL = "/rss/du-lich.rss"
        static let SCIENCE = "/rss/khoa-hoc.rss"
        static let DIGITAL = "/rss/so-hoa.rss"
        static let CAR = "/rss/xe.rss"
        static let OPINION = "/rss/y-kien.rss"
        static let CONFESSION = "/rss/tam-su.rss"
        static let JOKE = "/rss/cuoi.rss"
        static let MOST_VIEWED = "/rss/tin-xem-nhieu.rss"
    }
    struct TuoiTre {
        static let HOME = "/rss/tin-moi-nhat.rss"
        static let NEWS = "/rss/thoi-su.rss"
        static let WORLD = "/rss/the-gioi.rss"
        static let LAW = "/rss/phap-luat.rss"
        static let BUSINESS = "/rss/kinh-doanh.rss"
        static let TECHNOLOGY = "/rss/cong-nghe.rss"
        static let CAR = "/rss/xe.rss"
        static let YOUTH_LIFE = "/rss/nhip-song-tre.rss"
        static let CULTURE = "/rss/van-hoa.rss"
        static let ENTERTAINMENT = "/rss/giai-tri.rss"
        static let SPORT = "/rss/the-thao.rss"
        static let EDUCATION = "/rss/giao-duc.rss"
        static let SCIENCE = "/rss/khoa-hoc.rss"
        static let HEALTH = "/rss/suc-khoe.rss"
        static let FAKE_NEWS = "/rss/gia-that.rss"
        static let RELAX = "/rss/thu-gian.rss"
        static let READERS_AS_REPORTER = "/rss/ban-doc-lam-bao.rss"
        static let TRAVEL = "/rss/du-lich.rss"
    }
}
