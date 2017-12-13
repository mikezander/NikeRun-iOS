//
//  LocationVC.swift
//  Treads-iOS
//
//  Created by Michael Alexander on 12/13/17.
//  Copyright © 2017 Michael Alexander. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController, MKMapViewDelegate {
    
    var manager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()

        manager = CLLocationManager()
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.activityType = .fitness
    }
    
    func checkLocationAuthStatus() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            manager?.requestWhenInUseAuthorization()
            
        }
    }

}
