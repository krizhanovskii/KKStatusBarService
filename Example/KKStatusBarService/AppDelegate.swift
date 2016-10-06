//
//  AppDelegate.swift
//  KKStatusBarService
//
//  Created by k_krizhanovskii on 10/05/2016.
//  Copyright (c) 2016 k_krizhanovskii. All rights reserved.
//

import UIKit
import KKStatusBarService

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if KKStatusBarService.isServiceRunning == false {
            KKStatusBarService.startMonitoring()
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        KKStatusBarService.stopMonitoring()
    }


    func applicationDidBecomeActive(application: UIApplication) {
        KKStatusBarService.startMonitoring()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

