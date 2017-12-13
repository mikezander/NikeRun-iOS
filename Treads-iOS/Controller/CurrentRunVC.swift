//
//  CurrentRunVC.swift
//  Treads-iOS
//
//  Created by Michael Alexander on 12/13/17.
//  Copyright © 2017 Michael Alexander. All rights reserved.
//

import UIKit
import MapKit

class CurrentRunVC: LocationVC {

    @IBOutlet weak var swipeBGImageView: UIImageView!
    @IBOutlet weak var sliderImageView: UIImageView!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var paceLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    
    var runDistance = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeGesture = UIPanGestureRecognizer(target: self, action: #selector(endRunSwiped(sender:)))
        sliderImageView.addGestureRecognizer(swipeGesture)
        sliderImageView.isUserInteractionEnabled = true
        swipeGesture.delegate = self as? UIGestureRecognizerDelegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        manager?.delegate = self
        manager?.distanceFilter = 10
        startRun()
    }
    
    func startRun() {
        manager?.startUpdatingLocation()
    }
    
    func endRun() {
        manager?.stopUpdatingLocation()
    }
    @IBAction func pauseBtnPressed(_ sender: Any) {
        
    }
    
    @objc func endRunSwiped(sender: UIPanGestureRecognizer) {
        let minAdjust: CGFloat = 80
        let maxAdjust: CGFloat = 132
        if let sliderView = sender.view {
            if sender.state == UIGestureRecognizerState.began || sender.state == UIGestureRecognizerState.changed {
                
                let translation = sender.translation(in: self.view)
                
                if sliderView.center.x >= swipeBGImageView.center.x - minAdjust && sliderView.center.x <= swipeBGImageView.center.x + maxAdjust {
                    sliderView.center.x = sliderView.center.x + translation.x
                } else if sliderView.center.x >= swipeBGImageView.center.x + maxAdjust {
                    sliderView.center.x = swipeBGImageView.center.x + maxAdjust
                    // End Run has been requested
                    dismiss(animated: true, completion: nil)
                } else {
                    sliderView.center.x = swipeBGImageView.center.x - minAdjust
                }
                
                sender.setTranslation(CGPoint.zero, in: self.view)
            } else if sender.state == UIGestureRecognizerState.ended {
                UIView.animate(withDuration: 0.1, animations: {
                    sliderView.center.x = self.swipeBGImageView.center.x - minAdjust
                })
            }
        }
    }
}

extension CurrentRunVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            checkLocationAuthStatus()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil {
            startLocation = locations.first
        } else if let location = locations.last {
            runDistance += lastLocation.distance(from: location)
            distanceLbl.text = "\(runDistance)"
        }
        lastLocation = locations.last
    }
}
