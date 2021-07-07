//
//  ShareViewController.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit
import MapKit
import CoreLocation

enum Constant {
    static let copied = "Copied"
    static let completed = "completed"
    static let cencalled = "cencaled"
    static let presented = "presented"
    static let failed = "failed"
    static let sent = "sent"
    static let inviteMessage = "I've been using TransferWise to send money abroad. really easy and a lot cheaper than the bank! I got you a free transfer using my invite link: "
    static let link = "https://transferwise.com/invite/is/e6ecea"
}

class ShareViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func shareLocation(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: [" "], applicationActivities:  nil)
        activityController.completionWithItemsHandler = { (nil, completed, _, error) in
            completed ? print(Constant.completed) : print(Constant.cencalled)
        }
        present(activityController, animated: true) {
            print(Constant.presented)
        }
    }
}
