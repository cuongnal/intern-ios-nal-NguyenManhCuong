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
    static let DELETED_BOOKMARK = "Đã xóa bookmark"
    static let TEARMS_AND_CONDITIONS = "Terms & Conditions"
    
    struct Key {
        static let KEY_NEWS_BOOKMARK = "KEY_NEWS_BOOKMARK"
        static let KEY_TYPE_VN_EXPRESS = "KEY_TYPE_VN_EXPRESS"
        static let KEY_TYPE_TUOI_TRE = "KEY_TYPE_TUOI_TRE"
        static let USER_LOGIN = "USER_LOGIN"
        static let NAV_HOME = "NavHome"
        static let NAV_AUTH = "NavAuth"
        static var KEY_LANGUAGE_APP = "KEY_LANGUAGE_APP"
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

