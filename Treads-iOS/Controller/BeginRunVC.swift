//
//  BeginRunVC.swift
//  Treads-iOS
//
//  Created by Michael Alexander on 12/12/17.
//  Copyright © 2017 Michael Alexander. All rights reserved.
//

import UIKit
import MapKit

class BeginRunVC: LocationVC {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var lastRunCloseBtn: UIButton!
    @IBOutlet weak var paceLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var lastRunBGView: UIView!
    @IBOutlet weak var lastRunStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationAuthStatus()
        mapView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        manager?.delegate = self
        manager?.startUpdatingLocation()
        getLastRun()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        manager?.stopUpdatingLocation()
    }
    
    func getLastRun() {
        guard let lastRun = Run.getAllRuns()?.first else {
            hideRunData(hide: true)
            return
        }
        
        hideRunData(hide: false)
        
        paceLbl.text = lastRun.pace.formatTimeDurationToString()
        distanceLbl.text = "\(lastRun.distance.metersToMiles(places: 2)) mi"
        durationLbl.text = lastRun.duration.formatTimeDurationToString()
    }
    
    func hideRunData(hide: Bool) {
        if hide {
            lastRunBGView.isHidden = true
            lastRunCloseBtn.isHidden = true
            lastRunStack.isHidden = true
        } else {
            lastRunBGView.isHidden = false
            lastRunCloseBtn.isHidden = false
            lastRunStack.isHidden = false
        }
        
    }
    
    @IBAction func lastRunClosedBtnPressed(_ sender: Any) {
        hideRunData(hide: true)
    }
    
    @IBAction func locationCenterBtnPressed(_ sender: Any) {
    }
}

extension BeginRunVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            checkLocationAuthStatus()
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        }
    }
}
