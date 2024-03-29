//
//  ExtensionButton.swift
//  news_app
//
//  Created by hiepnv1 on 11/03/2024.
//

import UIKit


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
extension String {
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPred.evaluate(with: self)
    }
}
extension UIViewController {
    func showToast() {
        let toast = UITextView(frame: CGRect(x: self.view.frame.size.width/7, y: self.view.frame.size.height - 100, width: (self.view.frame.size.width/8)*6, height: 55))
        toast.backgroundColor = UIColor.black
        toast.textColor = Constant.COLOR_WHITE
        toast.text = "Email sent. Please check your email to reset your password"
        toast.textAlignment = .center
        toast.alpha = 1
        toast.font = UIFont.systemFont(ofSize: 16)
        toast.layer.cornerRadius = 25
        toast.clipsToBounds = true
        toast.textContainerInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0);
        toast.updateConstraintsIfNeeded()
        self.view.addSubview(toast)
        
        UIView.animate(withDuration: 4, delay: 0.1, options: .curveEaseInOut, animations: {
            toast.alpha = 0
        }, completion: nil)
    }
}
extension UIButton {

    open override var isEnabled: Bool{
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }

}
