//
//  PopoverChangeSourceVC.swift
//  news_app
//
//  Created by user on 4/11/24.
//

import Foundation
import UIKit
class PopoverChangeSourceVC : UIViewController {
    
    lazy var callBack : ((TypeClickPopover) -> ())? = nil
    
    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnSecond: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnFirst.setTitle(Constant.VN_EXPRESS, for: .normal)
        btnSecond.setTitle(Constant.TUOI_TRE,for: .normal)
    }
    
    @IBAction func touchFirst(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        callBack!(.vnExpress)
    }
    
    @IBAction func touchSecond(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        callBack!(.tuoiTre)
    }
    
    func setUp(anchor : UIView, hiddenDirections : Bool) {
        self.preferredContentSize = CGSize(width: 180, height: 90)
        self.modalPresentationStyle = .popover
        let ppc = self.popoverPresentationController
        ppc?.permittedArrowDirections = hiddenDirections ? [] : .up
        ppc?.sourceView = anchor
        
        ppc?.popoverLayoutMargins = hiddenDirections ? UIEdgeInsets() : UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        
        ppc?.sourceRect = hiddenDirections ? CGRect(x: 0, y: 80, width: 0, height: 0) : CGRect.null
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
