//
//  PopOverViewController.swift
//  news_app
//
//  Created by Manhcuong on 3/30/24.
//

import UIKit

class PopoverTableViewCellVC: BaseViewController{
    
    @IBOutlet weak var iconBookmark: UIImageView!
    lazy var callback : ((TypeClickPopover) -> ())? = nil
    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    var type : TypePopoverBookmark?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        setTitle()
        super.viewWillAppear(animated)
    }
    override func setUpLanguage() {
        setTitle()
    }
    private func setTitle() {
        guard let type = type else {return}
        btnFirst.setTitle(LanguageManager.getText(withKey: .share),for: .normal)
        if type == .popoverBookmark {
            btnSecond.setTitle(LanguageManager.getText(withKey: .bookmark),for: .normal)
            iconBookmark.image = UIImage(named: "ic_bookmark")
        }
        else {
            btnSecond.setTitle(LanguageManager.getText(withKey: .removeBookmark),for: .normal)
            iconBookmark.image = UIImage(named: "ic_bookmarked")
        }
    }
    
    // first là share
    @IBAction func touchFirst(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        callback?(.share)
    }
    //second là bookmark
    @IBAction func touchSecond(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        guard let type = type else {return}
        type == .popoverBookmark ? callback?(.bookmark) : callback?(.removeBookmark)
        dismiss(animated: true)
    }
    func setUp(anchor : UIView) {
        self.preferredContentSize = CGSize(width: 180, height: 90)
        self.modalPresentationStyle = .popover
        let ppc = self.popoverPresentationController
        ppc?.permittedArrowDirections = .up
        ppc?.sourceView = anchor
        ppc!.popoverLayoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        
    }
}
public enum TypeClickPopover : String{
    case vnExpress
    case tuoiTre
    case share
    case bookmark
    case removeBookmark
}
public enum TypePopoverBookmark : String {
    case popoverRemoveBookmark = "Remove Bookmark"
    case popoverBookmark = "Bookmark"
}
