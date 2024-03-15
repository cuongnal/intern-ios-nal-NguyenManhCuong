//
//  ExtensionButton.swift
//  news_app
//
//  Created by hiepnv1 on 11/03/2024.
//

import SwiftUI

extension UITextView {
    func vertivalTextView() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
                let size = sizeThatFits(fittingSize)
                let topOffset = (bounds.size.height - size.height * zoomScale) / 2
                let positiveTopOffset = max(1, topOffset)
                contentOffset.y = -positiveTopOffset
    }
}

