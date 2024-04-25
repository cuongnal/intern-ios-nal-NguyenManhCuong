//
//  ExtensionButton.swift
//  news_app
//
//  Created by hiepnv1 on 11/03/2024.
//

import UIKit
import FirebaseAuth


extension DateFormatter {
    func convertStringDateFormat(dateString: String) throws -> String?  {
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
    func isNotEmpty() -> Bool {return !self.isEmpty}
}
extension UIViewController {
    func showToast(text : String) {
        let toast = UITextView(frame: CGRect(x: self.view.frame.size.width/7, y: self.view.frame.size.height * 5 / 6, width: (self.view.frame.size.width/8)*6, height: 50))
        toast.backgroundColor = UIColor.black
        toast.textColor = Constant.COLOR_WHITE
        toast.text = text
        toast.textAlignment = .center
        toast.alpha = 1
        toast.font = UIFont.systemFont(ofSize: 14)
        toast.layer.cornerRadius = 25
        toast.clipsToBounds = true
        toast.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10);
        toast.updateConstraintsIfNeeded()
        self.view.addSubview(toast)
        toast.didMoveToSuperview()
        UIView.animate(withDuration: 2.5, delay: 0.1, options: .curveEaseInOut, animations: {
            toast.alpha = 0
        }, completion: {_ in toast.removeFromSuperview()})
    }
}
extension UIButton {

    open override var isEnabled: Bool{
        didSet {
            alpha = isEnabled ? 1.0 : 0.5
        }
    }
}
extension UIImage {
    
    func setImageByUrl (url : URL) {
       // let path = FileManager.default.urls(for: .documentDirectory, in: <#T##FileManager.SearchPathDomainMask#>)
    }
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)// lấy đường dẫn tới thư mục document
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
extension UIViewController {
    func show(text : String) {
        let toast = UITextView(frame: CGRect(x: self.view.frame.size.width/4, y: self.view.frame.size.height * 5 / 6, width: (self.view.frame.size.width/8)*4, height: 40))
        toast.backgroundColor = UIColor.black
        toast.textColor = Constant.COLOR_WHITE
        toast.text = text
        toast.textAlignment = .center
        toast.alpha = 1
        toast.font = UIFont.systemFont(ofSize: 16)
        toast.layer.cornerRadius = 20
        toast.clipsToBounds = true
        toast.textContainerInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0);
        toast.updateConstraintsIfNeeded()
        self.view.addSubview(toast)
        toast.didMoveToSuperview()
        UIView.animate(withDuration: 4, delay: 0.1, options: .curveEaseInOut, animations: {
            toast.alpha = 0
        }, completion: {_ in toast.removeFromSuperview()})
    }
}
