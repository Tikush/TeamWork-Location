//
//  ChosenViewModel.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import Foundation

protocol ChosenViewModelProtocol: AnyObject {
    func getName()
    var controller: CoordinatorDelegate { get }
    
    init(with controller: CoordinatorDelegate)
}


final class ChosenViewModel:ChosenViewModelProtocol {
    private(set) var controller: CoordinatorDelegate
    
    init(with controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func getName() {
        print("Bak") 
    }
}
