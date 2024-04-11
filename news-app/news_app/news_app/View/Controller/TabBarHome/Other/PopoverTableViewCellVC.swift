//
//  PopOverViewController.swift
//  news_app
//
//  Created by Manhcuong on 3/30/24.
//

import UIKit

class PopoverTableViewCellVC: UIViewController{
    
    lazy var callBack : ((TypeClickPopover) -> ())? = nil
    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnFirst.setTitle(Constant.SHARE, for: .normal)
        btnSecond.setTitle(Constant.BOOKMARK,for: .normal)
        
        btnFirst.setImage(UIImage(named: "ic_share"), for: .normal)
        btnSecond.setImage(UIImage(named: "ic_bookmark"), for: .normal)
    }
    // first là share
    @IBAction func touchFirst(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        callBack!(.share)
    }
    //second là bookmark
    @IBAction func touchSecond(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        callBack!(.bookmark)
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
}
