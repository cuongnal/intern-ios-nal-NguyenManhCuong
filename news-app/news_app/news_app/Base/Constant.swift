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
    static let COLOR_WHITE = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 255/255)
    static let COLOR_BLACK = UIColor.black
    static let KEY_ITEM_NEWS = "key_item_news"
    static let ANCHOR_POPOVER = "Anchor_Popover"
    static let SETTING = "Settings"
    static let ACCOUNT = "Account"
    static let SEARCH = "Search"
    static let BOOKMARKED = "Bookmarked"
    static let VN_EXPRESS = "Vn Express"
    static let TUOI_TRE = "Tuổi Trẻ"
    static let SHARE = "Share"
    static let BOOKMARK = "Bookmark"
    static let PICK_LANGUAGE_VIEW_CONTROLLER = "PickLanguageViewController"
    static let POP_OVER_NOTIFICATION = "PopoverNotification"
    static let CATEGORY_COLLECTION_VIEW_CELL = "CategoryCollectionViewCell"
    static let NEWS_TABLE_VIEW_CELL = "NewsTableViewCell"
    static let SETTING_TABLE_VIEW_CELLS = "SettingTableViewCell"
    static let ERROR_PASSWORD = "Incorrect password"
    static let ERROR_EMAIL = "Email error"
    static let SAVED_BOOKMARK = "Đã lưu bookmark"
    static let TEARMS_AND_CONDITIONS = "Terms & Conditions"
    static let TITLE_POLICY_1 = "Paragrap 1 \n \n"
    static let TITLE_POLICY_2 = "Paragrap 2 \n \n"
    static let POLICY_1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis quis venenatis, diam leo. Sed bibendum ac dui condimentum consequat tempus vel sit. Lectus sit tristique in nullam vitae sed feugiat. Aliquet diam elit mus viverra. Neque, molestie morbi cursus amet pellentesque aenean posuere nascetur. Eu risus id ultricies est. Ac, faucibus pellentesque ullamcorper amet diam varius interdum. \n \n"
    static let POLICY_2 = "Sit in vitae semper egestas sed posuere tellus nisl diam. Ipsum, nisl aenean fusce a, ut cras varius et. Enim egestas tempus velit molestie odio in aliquet. Orci gravida ac faucibus et eu phasellus elit, tellus. Dictum lacinia massa in amet elit. Felis magna et dis adipiscing porttitor sed. Fringilla ante lacus fermentum, ultricies volutpat neque, aliquet. Cras leo, porttitor tellus mi in. Nec volutpat in sed consequat pharetra tristique pulvinar sit. Id commodo tristique tellus in fringilla scelerisque mauris. Mauris quam euismod sit viverra a dictumst arcu sed laoreet. Volutpat bibendum amet diam semper. Nunc tellus eu auctor tellus vivamus a. Euismod orci, ut consequat consectetur praesent quis euismod id. \n \n"
    static let POLICY_3 = "Ornare quis arcu eget aliquet pretium. Viverra nulla fringilla eget nibh habitasse cras vestibulum amet. Dui luctus dictum leo vulputate tristique lacus. Facilisis facilisi ullamcorper et vitae. Diam molestie sit laoreet lacinia ultrices. Convallis et ipsum quis consectetur sed. Quisque libero lectus quam in leo tincidunt. Venenatis id sodales pellentesque aliquet nibh egestas suspendisse nibh. Hendrerit non mauris, magna malesuada venenatis, eu. Enim, sed metus porttitor amet tortor neque sed. \n \n"
    static let CATEGORY_VN_EXPRESS = [
        Category(idCate: UUID(), title: "Trang chủ", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.HOME,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate: UUID(), title: "Thế giới", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.WORLD,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate: UUID(), title: "Thời sự", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.NEWS,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate: UUID(), title: "Kinh doanh", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.BUSINESS,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate: UUID(), title: "Startup", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.STARTUP,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate: UUID(), title: "Giải trí", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.ENTERTAINMENT,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate: UUID(), title: "Thể thao", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.SPORT,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate: UUID(), title: "Pháp luật", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.LAW,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate: UUID(), title: "Giáo dục", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.EDUCATION,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate: UUID(), title: "Tin mới nhất", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.LATES_NEWS,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Tin nổi bật", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.HOT_NEWS,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Sức khỏe", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.HEALTH,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Đời sống", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.LIFE,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Du lịch", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.TRAVEL,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Khoa học", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.SCIENCE,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Số hóa", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.DIGITAL,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Xe", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.CAR,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Ý kiến", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.OPINION,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Tâm sự", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.CONFESSION,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Cười", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.JOKE,typeSource: TypeSource.vnExpress.rawValue),
        Category(idCate:  UUID(), title: "Tin xem nhiều", url: Api.BASE_URL_VNEXPRESSS + Api.Vnexpress.MOST_VIEWED,typeSource: TypeSource.vnExpress.rawValue)
    ]
    
    static let CATEGORY_TUOI_TRE = [
        Category(idCate: UUID(), title: "Trang chủ", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.HOME,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate: UUID(), title: "Thời sự", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.NEWS,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate: UUID(), title: "Thế giới", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.WORLD,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate: UUID(), title: "Pháp luật", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.LAW,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate: UUID(), title: "Kinh doanh", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.BUSINESS,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate: UUID(), title: "Công nghệ", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.TECHNOLOGY,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate: UUID(), title: "Xe", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.CAR,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate: UUID(), title: "Nhịp sống trẻ", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.YOUTH_LIFE,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate: UUID(), title: "Văn hóa", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.CULTURE,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate: UUID(), title: "Giải trí", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.ENTERTAINMENT,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate:  UUID(), title: "Thể thao", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.SPORT,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate:  UUID(), title: "Giáo dục", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.EDUCATION,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate:  UUID(), title: "Khoa học", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.SCIENCE,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate:  UUID(), title: "Sức khỏe", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.HEALTH,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate:  UUID(), title: "Giả thật", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.FAKE_NEWS,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate:  UUID(), title: "Thư giãn", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.RELAX,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate:  UUID(), title: "Bạn đọc làm báo", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.READERS_AS_REPORTER,typeSource: TypeSource.tuoiTre.rawValue),
        Category(idCate:  UUID(), title: "Du lịch", url: Api.BASE_URL_TUOITRE + Api.TuoiTre.TRAVEL,typeSource: TypeSource.tuoiTre.rawValue)
    ]
    struct Key {
        static let KEY_NEWS_BOOKMARK = "KEY_NEWS_BOOKMARK"
        static let KEY_TYPE_VN_EXPRESS = "KEY_TYPE_VN_EXPRESS"
        static let KEY_TYPE_TUOI_TRE = "KEY_TYPE_TUOI_TRE"
        static let USER_LOGIN = "USER_LOGIN"
    }
    struct Error {
        static let LABLE_ERROR = "Lỗi"
        static let ERROR_PASSWORD = "Mật khẩu không chính xác"
        static let ERROR_EMAIL = "Email chưa được đăng ký"
        static let EMAIL_ALREADY_IN_USE = "Email đã được sử dụng"
        static let INVALID_EMAIL = "Email không hợp lệ"
        static let NIL = "Lỗi không xác định : \n"
        static let ERROR_SENT_MAIL = "Email sent. Please check your email to reset your password"
    }
    
}

