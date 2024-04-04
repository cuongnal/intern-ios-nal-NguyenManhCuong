//
//  NewsByTypeImp.swift
//  news_app
//
//  Created by hiepnv1 on 03/04/2024.
//

import Foundation

class RemoteNewsRepositoryImp : RemoteNewsRepository {
    let parser = XMLParserToObject.getInstance()
    
    func getNewsByTypeCategory(category : Category ) -> [ItemRss] {
       return parser.callFromByUrl(category: category)
    }
    
}
