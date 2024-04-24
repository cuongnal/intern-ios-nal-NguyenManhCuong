//
//  XMLParserToObject.swift
//  news_app
//
//  Created by hiepnv1 on 25/03/2024.
//

import Foundation


class XMLParserToObject : NSObject, XMLParserDelegate {
    
    var arrNews : [News] = []
    private var rootElement = "item"
    
    var flag = false
    
    private var elementName : String = ""
    private var news : News? = nil
    private var category : Category = AppDefault.CATEGORY_VN_EXPRESS[0]
    
    private static var instance : XMLParserToObject? = nil
    private override init() {
        super.init()
    }
    static func getInstance() -> XMLParserToObject{
        guard let instance = instance else {
            self.instance = XMLParserToObject()
            return self.instance!
        }
        return instance
    }
    
    func callFromByUrl(category : Category, result : ([News])  -> ()) {
        self.category = category
        arrNews = []
        guard let stringURL = category.url, let url = URL(string: stringURL) else {return}
        let parser = XMLParser(contentsOf: url)
        parser?.delegate = self
        parser?.parse()
        result(arrNews)
    }
    func callFromByUrl(category : Category) -> [News] {
        self.category = category
        arrNews = []
        guard let stringURL = category.url, let url = URL(string: stringURL) else {return []}
        let parser = XMLParser(contentsOf: url)
        parser?.delegate = self
        parser?.parse()
        return arrNews
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        self.elementName = elementName
        if(elementName == rootElement) {
            flag = true
            news = News()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if flag {
            switch (elementName) {
            case "title" :
                news?.title += string.trimmingCharacters(in: .whitespacesAndNewlines)
            case "link" :
                news?.link += string.trimmingCharacters(in: .whitespacesAndNewlines)
            case "pubDate" :
                news?.pubDate += string.trimmingCharacters(in: .whitespacesAndNewlines)
            default : break
            }
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if flag {
            if elementName == rootElement {
          //      news?.typeSource = category.title
                news?.createPrimaryKey()
                news?.idCate = category.idCate
                news?.typeCategory = category.title
                news?.author = category.typeSource == TypeSource.vnExpress.rawValue
                                                ? Constant.VN_EXPRESS : Constant.TUOI_TRE
                arrNews.append(news!)
                
                news = nil
                flag = false
            }
        }
    }
    
    func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        if flag {
            switch (elementName) {
            case "title" :
                news?.title += String(data: CDATABlock, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            case "link" :
                news?.link += String(data: CDATABlock, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            case "pubDate" :
                news?.pubDate += String(data: CDATABlock, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            case "description" :
                news?.des += String(data: CDATABlock, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            default : break
            }
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        formatDateAndImage()
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        
    }
    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        
    }
    func formatDateAndImage () {
        for (index, item) in arrNews.enumerated() {
            do {
                try arrNews[index].pubDate = DateFormatter().convertStringDateFormat(dateString: item.pubDate) ?? ""
            }
            catch {}
            if let stringStart = item.des.range(of: "src=\""), let stringEnd = item.des.range(of: "\"",range: stringStart.upperBound..<item.des.endIndex){
                arrNews[index].urlImage = String(item.des[stringStart.upperBound..<stringEnd.lowerBound])
                
            }
        }
    }
}
