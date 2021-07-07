//
//  RoutersViewController.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit
import CoreLocation
import MapKit

class RoutersViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    private var routersViewModel: RoutersViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()
    }
    
    func configViewModel() {
        routersViewModel = RoutersViewModel(with: self,
                                            with: CLLocationManager(),
                                            with: mapView)
    }
}

