//
//  XMLParserToObject.swift
//  news_app
//
//  Created by hiepnv1 on 25/03/2024.
//

import Foundation

protocol XMLParserDelegateCallBack {
    func parsingWasFinished(arrNews: [News])
}
class XMLParserToObject : NSObject, XMLParserDelegate {
    
    var arrNews : [News] = []
    var rootElement = "item"
    
    var flag = false
    
    var elementName : String = ""
    var news : News? = nil
    
    var callBack : XMLParserDelegateCallBack? = nil
    
    func callFromByUrl(url : URL) {
        let parser = XMLParser(contentsOf: url)
        parser?.delegate = self
        parser?.parse()
        arrNews = []
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
                news?.description += String(data: CDATABlock, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
            default : break
            }
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        formatDateAndImage()
        callBack?.parsingWasFinished(arrNews : self.arrNews)
    }
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        
    }
    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        
    }
    func formatDateAndImage () {
        for (index, item) in arrNews.enumerated() {
            arrNews[index].pubDate = DateFormatter().convertStringDateFormat(dateString: item.pubDate) ?? "sssss"
            if let stringStart = item.description.range(of: "src=\""), let stringEnd = item.description.range(of: "\"",range: stringStart.upperBound..<item.description.endIndex){
                arrNews[index].image = String(item.description[stringStart.upperBound..<stringEnd.lowerBound])
                print(arrNews[index].image)
            }
        }
    }
}
