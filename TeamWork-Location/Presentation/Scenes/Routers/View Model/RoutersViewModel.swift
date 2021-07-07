//
//  RoutersViewModel.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class RoutersViewModel: NSObject, MKMapViewDelegate {
    
    private var globalLocations: [CLLocationCoordinate2D] = []
    var locationManager: CLLocationManager!
    var rootController: RoutersViewController!
    var mapView: MKMapView!
    
    init(with rootController: RoutersViewController, with locationManager: CLLocationManager, with mapView: MKMapView) {
        super.init()
        self.locationManager = locationManager
        self.rootController = rootController
        self.mapView = mapView
        configMapView()
    }
    
    func configMapView() {
        mapView.delegate = self
    }
    
    
    
}


