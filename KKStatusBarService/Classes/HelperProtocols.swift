//
//  HelperProtocols.swift
//  KKCustomAlertView
//
//  Created by Krizhanovskii on 9/30/16.
//  Copyright © 2016 k.krizhanovskii. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterView {
    var view : UIView! { get set }
    func configure()
}

extension RegisterView where Self:UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
    func xibSetuView() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: Self.nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.frame = bounds
        view.backgroundColor = .white
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
        return view
    }
}
