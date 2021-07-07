//
//  ChosenMapsViewController.swift
//  TeamWork-Location
//
//  Created by Baxva Jakeli on 07.07.21.
//

import UIKit
import MapKit

class ChosenMapsViewController: BaseViewController {

    @IBOutlet weak var theMap: MKMapView!
    var country: Country?
    var lat: CLLocationDegrees!
    var longt: CLLocationDegrees!
    var theLocation: CLLocationCoordinate2D!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpUserDefaults()
        setUpMap()
    }

}

extension ChosenMapsViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is PinAnnotation {
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
            pinView.pinTintColor = .blue
            pinView.isDraggable = true
            pinView.animatesDrop = true
            pinView.canShowCallout = true
            return pinView
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let lat = view.annotation?.coordinate.latitude
        let long = view.annotation?.coordinate.longitude
        
        createUserDefault(lat: lat, longt: long)
    }
    
    func setUpUserDefaults() {
//        eseni api-s infos ro gadmomewodeba mere imushavebs
//        lat = country.latlng?[0]
//        longt = country.latlng?[1]
        
        if UserDefaults.standard.value(forKey: "lat") != nil {
            lat = (UserDefaults.standard.value(forKey: "lat") as! CLLocationDegrees)
        }
        if UserDefaults.standard.value(forKey: "longt") != nil {
            longt = (UserDefaults.standard.value(forKey: "longt") as! CLLocationDegrees)
        }
        
    }
    
    func setUpMap() {
        theMap.delegate = self
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: longt)
        let annotation = PinAnnotation(coordinate: coordinate, title: "Drag Pin", subtitle: "")
        theMap.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 100_000, longitudinalMeters: 100_000)
        self.theMap.setRegion(region, animated: true)
    }
    
    func createUserDefault(lat:CLLocationDegrees?, longt: CLLocationDegrees?) {
        guard let latitude = lat else {return}
        guard let longtitude = longt else {return}
        UserDefaults.standard.set(latitude, forKey: "lat")
        UserDefaults.standard.set(longtitude, forKey: "longt")
    }
}
