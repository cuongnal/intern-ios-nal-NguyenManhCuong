//
//  PopOverViewController.swift
//  news_app
//
//  Created by Manhcuong on 3/30/24.
//

import UIKit

class PopoverViewController: UIViewController{
    
    var callBack : ((TypeClickPopover) -> ())? = nil
    
    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchTuoiTre(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        callBack!(.tuoiTre)
    }
    @IBAction func touchVNExpress(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        callBack!(.vnExpress)
    }
    func setUp(anchor : UIView, hiddenDirections : Bool) {
        self.preferredContentSize = CGSize(width: 180, height: 90)
        self.modalPresentationStyle = .popover
        let ppc = self.popoverPresentationController
        ppc?.permittedArrowDirections = hiddenDirections ? [] : .up
        ppc?.sourceView = anchor
        
        ppc!.popoverLayoutMargins = hiddenDirections ? UIEdgeInsets() : UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)

        ppc?.sourceRect = hiddenDirections ? CGRect(x: 0, y: 80, width: 0, height: 0) : CGRect.null
    }
}
public enum TypeClickPopover : String{
    case vnExpress
    case tuoiTre
    case share
    case bookmark
}
