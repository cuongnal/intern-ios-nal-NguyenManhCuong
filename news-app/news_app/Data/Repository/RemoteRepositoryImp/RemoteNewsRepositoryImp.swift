//
//  NewsByTypeImp.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//

import Foundation

class RemoteNewsRepositoryImp : RemoteNewsRepository {
    let parser = XMLParserToObject.getInstance()
    
    func getNewsByTypeCategory(category : Category ) -> [News] {
        return parser.callFromByUrl(category: category)
    }
    func getAllNewsWithSource (typeSource : TypeSourceNews) -> [News] {
        var arrNews : [News] = []
        if typeSource == .vnExpress {
            for item in Constant.CATEGORY_VN_EXPRESS {
                arrNews.append(contentsOf: parser.callFromByUrl(category: item))
            }
        }
        else {
            for item in Constant.CATEGORY_TUOI_TRE {
                arrNews.append(contentsOf: parser.callFromByUrl(category: item))
            }
        }
        return arrNews
    }
}
