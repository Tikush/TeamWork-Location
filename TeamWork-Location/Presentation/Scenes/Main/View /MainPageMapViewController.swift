//
//  MainPageMapViewController.swift
//  TeamWork-Location
//
//  Created by Teo Elisashvili on 08.07.21.
//

import UIKit
import MapKit

class MainPageMapViewController: BaseViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var countries: [MainViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        print(countries.count)
        
        let anotation = MKPointAnnotation()
        anotation.coordinate = CLLocationCoordinate2D(latitude: 40,
                                                      longitude: 45)
        let anotation2 = MKPointAnnotation()
        anotation.coordinate = CLLocationCoordinate2D(latitude: 24.25,
                                                      longitude: -76)
        let anotation3 = MKPointAnnotation()
        anotation.coordinate = CLLocationCoordinate2D(latitude: 53,
                                                      longitude: 28)
        
//        mapView.addAnnotations(pins[0].latlng)

    }
}
