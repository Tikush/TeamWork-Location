//
//  LocationManager.swift
//  TeamWork-Location
//
//  Created by Ana Mepisashvili on 7/7/21.
//

import Foundation
import CoreLocation

struct Location {
    let title: String
    let coordinates: CLLocationCoordinate2D
}

class LocationManager: NSObject {
    static let shared = LocationManager()
   
    let manager = CLLocationManager()
}

