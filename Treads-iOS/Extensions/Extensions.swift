//
//  Extensions.swift
//  Treads-iOS
//
//  Created by Michael Alexander on 12/13/17.
//  Copyright © 2017 Michael Alexander. All rights reserved.
//

import Foundation

extension Double {
    func metersToMiles(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return ((self / 1609.3) * divisor).rounded() / divisor
    }
}
