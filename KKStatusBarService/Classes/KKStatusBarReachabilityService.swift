//
//  KKStatusBarReachabilityService.swift
//  KKCustomAlertView
//
//  Created by Krizhanovskii on 10/5/16.
//  Copyright © 2016 k.krizhanovskii. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

public class KKStatusBarService : NSObject {
    private typealias view = KKStatusBarView
    
    /*
        set error message,by default = "Internet connection error"
    */
    public static var errorMessage : String? {
        willSet(value) {
            view.shared.redStatusText = value ?? view.shared.redStatusText
        }
    }
    
    
    /*
        set error background color, by default  red - #F44336
     */
    public static var errorBackgroundColor : UIColor? {
        willSet(value) {
            view.shared.redStatusColor = value ?? view.shared.redStatusColor
        }
    }
    
    /*
     set error text color, by default  red - white
     */
    public static var errorTextColor : UIColor? {
        willSet(value) {
            view.shared.redStatusTextColor = value ?? view.shared.redStatusTextColor
        }
    }
    
    /*
        set connection message,by default = "Connected"
     */
    public static var connectedMessage : String? {
        willSet(value) {
            view.shared.greenStatusText = value ?? ""
        }
    }
    
    /*
        set connected color, by default  red - #00E676
     */
    public static var connectedColor : UIColor? {
        willSet(value) {
            view.shared.greenStatusColor = value ?? view.shared.greenStatusColor
        }
    }
    
    /*
     set connected text color, by default  red - white
     */
    public static var connectedTextColor : UIColor? {
        willSet(value) {
            view.shared.greenStatusTextColor = value ?? view.shared.greenStatusTextColor
        }
    }

    /*
        return status of status Service running. Default bool
     */
    public static var isServiceRunning = false
    /*
        set check time. Default 5
     */
    public static var kTimeToCheck : Double = 5.0 {
        willSet(value) {
            self.kTimeToCheck = max(3.0,value)
        }
    }

    // timer instance
    private static var timer : Timer?
    
    /// Start internet connection monitoring
    /// every *kTimeToCheck* seconds check connection to internet
    public static func startMonitoring() {
        isServiceRunning = true
        self.checkInternet()
        self.timerIterate()
    }
    
    /// Stop monitoring
    public static func stopMonitoring() {
        isServiceRunning = false
        timer?.invalidate()
        timer = nil
        view.shared.hide()
    }
    
    
    /// Force hide
    public static func forceHide() {
        view.shared.hide()
    }
    
    ///Force show
    public static func forceShow() {
        view.shared.show()
    }
    
    ///Force connected
    public static func forceConnected() {
        view.shared.connected()
    }
    
    
    // unc for start timer
    private static func timerIterate() {
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: kTimeToCheck, repeats: true, block: { (timer) in
                KKStatusBarService.checkInternet()
            })
        } else {
            // Fallback on earlier versions
            timer = Timer.scheduledTimer(timeInterval: kTimeToCheck, target: self, selector: #selector(KKStatusBarService.checkInternet), userInfo: nil, repeats: true)
        }
    }
    
    /// Check internet weather
    /// if no connection -> show KKStatusView
    @objc private static func checkInternet() {
        if self.isServiceRunning {
            if Reachability.isConnectedToNetwork() {
                if view.shared.isShowed {
                    view.shared.connected()
                }
            } else {
                if !view.shared.isShowed {
                    view.shared.show()
                }
            }
        }
    }
}


// Reachability class
public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
        
    }
}
