//
//  ExtensionButton.swift
//  news_app
//
//  Created by hiepnv1 on 11/03/2024.
//

import UIKit

extension UITextView {
//    func vertivalTextView() {
//        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
//        let size = sizeThatFits(fittingSize)
//        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
//        let positiveTopOffset = max(1, topOffset)
//        contentOffset.y = -positiveTopOffset
//    }
}
extension DateFormatter {
    func convertStringDateFormat(dateString: String) -> String? {
        self.dateFormat = "eee, dd MMM yyyy HH:mm:ss Z"
        guard let date = self.date(from: dateString) else {
            return nil
        }
        let time = Date().timeIntervalSince(date)
        switch (time/(3600)) {
        case 1...24 :
            return "\(Int(time/3600)) tiếng trước"
        case 0...1 :
            return "\(Int(time/60)) phút trước"
        default:
            self.dateFormat = "dd/MM/yyyy"
            return self.string(from: date)
        }
    }
}
