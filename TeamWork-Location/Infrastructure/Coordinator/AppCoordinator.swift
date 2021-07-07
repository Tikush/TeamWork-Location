//
//  AppCoordinator.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private properties
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    // MARK: - Internal properties
    
    var networkManager: NetworkManagerProtocl
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
        
        self.networkManager = NetworkManager()
    }
    
    func start() {
        let vc = SignInViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(vc, animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
