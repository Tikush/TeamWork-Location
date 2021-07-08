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
        
        anotations(countries)
    }
    
    func anotations(_ array: [MainViewModel]) {
        for country in countries {
            let anotation = MKPointAnnotation()
            anotation.coordinate = CLLocationCoordinate2D( latitude: country.latlng[0],
                                                           longitude: country.latlng[1])
            mapView.addAnnotation(anotation)
        }
    }
}
