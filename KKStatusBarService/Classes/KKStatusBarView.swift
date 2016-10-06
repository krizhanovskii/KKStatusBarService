//
//  KKStatusView.swift
//  KKCustomAlertView
//
//  Created by Krizhanovskii on 10/5/16.
//  Copyright © 2016 k.krizhanovskii. All rights reserved.
//

import Foundation
import UIKit

class KKStatusBarView: UIView, RegisterView {
    
    open var isShowed : Bool = false
    fileprivate let kTime : Double = 0.7
    
    var redStatusColor = UIColor(red: 244.0/255.0, green: 67.0/255.0, blue: 54.0/255.0, alpha: 1.0)
    var greenStatusColor = UIColor(red: 0.0/255.0, green: 230.0/255.0, blue: 118.0/255.0, alpha: 1.0)

    var redStatusText = "Internet connection error"
    var greenStatusText = "Connected"
    
    
    var redStatusTextColor : UIColor = .white
    var greenStatusTextColor : UIColor = .white
    
    static var shared = KKStatusBarView()
    @IBOutlet var lblText: UILabel!

    //MARK:RegisterView
    var view: UIView! {
        didSet {
            configure()
        }
    }
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        ({ view = xibSetuView() })()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ({ view = xibSetuView() })()
    }
    
    convenience init() {
        self.init(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:20))
    }
    
    @IBAction func btnClose(_ sender: AnyObject) {
        if KKStatusBarService.isServiceRunning {
            KKStatusBarService.stopMonitoring()
        } else {
            self.hide()
        }
    }
}

extension KKStatusBarView {
    // configure view and statuses
    func configure() {
        self.presetView()
        self.redStatus()
    }
    
    private func redStatus() {
        self.view.backgroundColor = self.redStatusColor
        self.lblText.text = self.redStatusText
        self.lblText.textColor = self.redStatusTextColor
    }
    
    private func greenStatus() {
        self.view.backgroundColor = self.greenStatusColor
        self.lblText.text = self.greenStatusText
        self.lblText.textColor = self.greenStatusTextColor

    }
    
    private func presetView() {
        self.alpha = 0
        var fr = self.view.frame
        fr.origin.y = -20
        self.view.frame = fr
    }
    
    // func for view
    private func addToCntrl() {
        if UIApplication.topViewController()?.navigationController != nil {
            UIApplication.topViewController()?.navigationController?.view.addSubview(self)
        } else {
            UIApplication.topViewController()?.view.addSubview(self)
        }
    }
    
    
    // func for show
    // show red view with error message
    func show() {
        addToCntrl()
        self.redStatus()
        
        UIView.animate(withDuration: self.kTime, delay: 0, options: .allowUserInteraction, animations: {
            var fr = self.view.frame
            fr.origin.y = 0
            self.view.frame = fr
            self.alpha = 1
            
            UIApplication.shared.setStatusBarHidden(hidden: true)
            
        }) { (flag) in
            self.isShowed = true
        }
    }
    
    // func for hide
    // only hide view
    func hide() {
        UIView.animate(withDuration: self.kTime/2, animations: {
            var fr = self.view.frame
            fr.origin.y = 0 - self.view.frame.height
            self.view.frame = fr
            self.alpha = 0
            
            UIApplication.shared.setStatusBarHidden(hidden: false)
            self.isShowed = false
            
        }) { (flag) in
            self.removeFromSuperview()
            self.redStatus()
        }
    }
    
    //func for connected 
    // show green message
    // after uses hide
    func connected() {
        UIView.animate(withDuration: self.kTime, delay: 0, options: .allowUserInteraction, animations: {
            self.greenStatus()
        }) { (flag) in
            self.hide()
        }
    }
}



