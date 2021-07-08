//
//  TabBarController.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = self.viewControllers![1] as! MainViewController
        vc1.coordinator = coordinator
        
        let vc2 = self.viewControllers![2] as! ChosenCountriesViewController
        vc2.coordinator = coordinator
    }
}
