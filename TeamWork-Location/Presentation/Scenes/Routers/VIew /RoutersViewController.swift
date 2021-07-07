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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        routersViewModel?.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        routersViewModel?.stopUpdatingLocation()
    }
    
    func configViewModel() {
        routersViewModel = RoutersViewModel(with: self,
                                            with: CLLocationManager(),
                                            with: mapView)
    }
    
}

