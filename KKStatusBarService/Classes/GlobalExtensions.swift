//
//  GlobalExtensions.swift
//  KKCustomAlertView
//
//  Created by Krizhanovskii on 10/5/16.
//  Copyright © 2016 k.krizhanovskii. All rights reserved.
//

import Foundation
import  UIKit

extension UIApplication {
    func setStatusBarHidden(hidden:Bool) {
        let statusBar: UIView = UIApplication.shared.value(forKey:"statusBar") as! UIView
        statusBar.alpha = hidden ? 0 : 1
    }
    
    func setStatusBarHidden(hidden:Bool, withAnimationTime time:Double) {
        UIView.animate(withDuration: time) {
            let statusBar: UIView = UIApplication.shared.value(forKey:"statusBar") as! UIView
            statusBar.alpha = hidden ? 0 : 1
            
            var frame = statusBar.frame
            frame.origin.y = hidden ? 0 - statusBar.frame.height : 0
            statusBar.frame = frame
        }
    }
    
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController , top.view.window != nil {
                return topViewController(base: top)
            } else if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
    
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
