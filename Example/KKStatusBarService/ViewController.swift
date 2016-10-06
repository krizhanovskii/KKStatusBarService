//
//  ViewController.swift
//  KKStatusBarService
//
//  Created by k_krizhanovskii on 10/05/2016.
//  Copyright (c) 2016 k_krizhanovskii. All rights reserved.
//

import UIKit
import KKStatusBarService
class ViewController: UIViewController {
    
    //buttons
    @IBOutlet var btnStartStopmonitoring: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.customDesign()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnForceShowPressed(_ sender: AnyObject) {
    }
    
    func customDesign() {
        self.navigationController?.navigationBar.barTintColor = .blue
        KKStatusBarService.kTimeToCheck = 3
        self.btnStartStopmonitoring.setTitle("Start", for: .normal)

    }
    
    @IBAction func btnForceShow(_ sender: AnyObject) {
        KKStatusBarService.forceShow()

    }
    
    @IBAction func btnStartStopPressed(_ sender: AnyObject) {
        if KKStatusBarService.isServiceRunning == false {
            KKStatusBarService.startMonitoring()
            self.btnStartStopmonitoring.setTitle("Stop", for: .normal)
        } else {
            KKStatusBarService.stopMonitoring()
            self.btnStartStopmonitoring.setTitle("Start", for: .normal)

        }
    }
    @IBAction func btnForceStopPressed(_ sender: AnyObject) {
        KKStatusBarService.forceHide()
    }
    @IBAction func btnForceConnectPressed(_ sender: AnyObject) {
        KKStatusBarService.forceConnected()
    }
}

