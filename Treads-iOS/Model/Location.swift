//
//  Location.swift
//  Treads-iOS
//
//  Created by Michael Alexander on 12/16/17.
//  Copyright © 2017 Michael Alexander. All rights reserved.
//

import Foundation
import RealmSwift

class Location: Object {
    @objc dynamic public private(set) var latitude =  0.0
    @objc dynamic public private(set) var longitude = 0.0
    
    convenience init(latitude: Double, longitude: Double) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
