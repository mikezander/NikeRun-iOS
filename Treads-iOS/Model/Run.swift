//
//  Run.swift
//  Treads-iOS
//
//  Created by Michael Alexander on 12/15/17.
//  Copyright © 2017 Michael Alexander. All rights reserved.
//

import Foundation
import RealmSwift

class Run: Object {
    @objc dynamic public private(set) var id = ""
    @objc dynamic public private(set) var date = NSDate()
    @objc dynamic public private(set) var pace = 0
    @objc dynamic public private(set) var distance = 0.0
    @objc dynamic public private(set) var duration = 0
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    override class func indexProperties() -> [String] {
        return ["pace", "date", "duration"]
    }
    
    convenience override init(pace: Int, distance: Double, duration: Int) {
        self.init()
        self.id = UUID().uuidString.lowercased()
        self.date = NSDate()
        self.pace = pace
        self.distance = distance
        self.duration = duration
    }
    
}
