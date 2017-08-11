//
//  ViewController.swift
//  Walk
//
//  Created by asingiri on 5/12/17.
//  Copyright © 2017 kavya. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
 
    @IBOutlet weak var stepsCountLabel: UILabel!
    let pedometer = CMPedometer()
    let activityManager = CMMotionActivityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startStepCounting()
//        self.startUpdatingActivity()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.pedometer.stopUpdates()
        self.activityManager.stopActivityUpdates()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Internal methods
    func startStepCounting() {
        if CMPedometer.isStepCountingAvailable() {
            print("Inside steps counting")
            self.pedometer.startUpdates(from: Date()) { data, error in
                DispatchQueue.main.async(execute: { _ in
                    if (data != nil && error == nil) {
                        let steps = data!.numberOfSteps
                        self.stepsCountLabel.text = "steps: \(steps)"
                    }
                })
            }
        }
    }
    
//    func startUpdatingActivity() {
//        if CMMotionActivityManager.isActivityAvailable() {
//            self.activityManager.startActivityUpdates(to: OperationQueue.main, withHandler: {
//                [weak self] (data: CMMotionActivity?) in
//                DispatchQueue.main.async(execute: {
//                    if let data = data {
//                        self?.stationaryLabel.text = "stationary: \(data.stationary)"
//                        self?.walkingLabel.text = "walking: \(data.walking)"
//                        self?.runningLabel.text = "running: \(data.running)"
//                        self?.automotiveLabel.text = "automotive: \(data.automotive)"
//                        self?.unknowLabel.text = "unknown: \(data.unknown)"
//                        self?.confidenceLabel.text = "confidence(0-2): \(data.confidence.rawValue)"
//                    }
//                })
//            })
//        }
//    }
}
    
//    let activityManager = CMMotionActivityManager()
//    let pedoMeter = CMPedometer()
//    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
////        if let actManager = activityManager{
////            print("We have activity Manager")
////        }
////        else{
////            print("No activity Manager")
////        }
//        
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


//}

