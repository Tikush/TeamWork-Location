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

class RoutersViewModel: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
    
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
        configManager()
        configGesture()
    }
    
    func configMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    func configManager() {
        locationManager.delegate = self
    }
    
    func configGesture() {
        let gesture = UILongPressGestureRecognizer(target: self.rootController,
                                             action: #selector(self.rootController.onTap))
        gesture.minimumPressDuration = TimeInterval(1)
        mapView.isUserInteractionEnabled = true
        mapView.addGestureRecognizer(gesture)
    }
    
    func userLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
    }
    
    func centerOnUser() {
        guard let location = locationManager.location else { return }
        let regionRadius: CLLocationDistance = 8_00

        let region = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        
        mapView.setRegion(region, animated: true)
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//    }

}


