//
//  MapViewController.swift
//  TeamWork-Location
//
//  Created by Ana Mepisashvili on 7/7/21.
//

import UIKit
import MapKit


class MapViewController: BaseViewController {
 
    let mapView = MKMapView()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
    


}
