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
    }
}
