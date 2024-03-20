//
//  News.swift
//  news_app
//
//  Created by hiepnv1 on 20/03/2024.
//

import SwiftUI

struct News {
    var imageNews : String?
    var titleNews : String?
    var timeNews : String?
    var authorNews : String?
    var typeNews : String?
    init(imageNews : String?, titleNews : String?,timeNews : String?,authorNews : String?,typeNews : String?) {
        self.imageNews = imageNews
        self.authorNews = authorNews
        self.timeNews = timeNews
        self.titleNews = titleNews
        self.typeNews = typeNews
    }
}
struct ItemNews {
    
}

