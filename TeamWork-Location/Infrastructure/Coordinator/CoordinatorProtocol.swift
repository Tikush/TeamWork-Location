//
//  CoordinatorProtocol.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var networkManager: NetworkManagerProtocl { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func proceedToChosenMapsViewController(with country: Country)
}
