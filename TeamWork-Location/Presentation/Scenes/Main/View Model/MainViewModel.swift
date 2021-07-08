//
//  MainViewModel.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import Foundation

class MainViewModel {
    
    private var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var name: String {
        country.name ?? ""
    }
    
    var capital: String {
        country.capital ?? ""
    }
    
    var latlng: [Double] {
        country.latlng ?? []
    }
}
