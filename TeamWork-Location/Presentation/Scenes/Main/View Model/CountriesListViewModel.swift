//
//  CountriesListViewModel.swift
//  TeamWork-Location
//
//  Created by Teo Elisashvili on 08.07.21.
//

import UIKit

protocol CountriesListViewModelProtocol: AnyObject {
    func getCountriesList(completion: @escaping (([MainViewModel]) -> Void))
    
    init(with countriesManager: CountriesManagerProtocol)
}

class CountriesListViewModel: CountriesListViewModelProtocol {
    
    private var countriesManager: CountriesManagerProtocol!
    
    required init(with countriesManager: CountriesManagerProtocol)  {
        self.countriesManager = countriesManager
    }
    
    func getCountriesList(completion: @escaping (([MainViewModel]) -> Void)) {
        countriesManager.fetchCountries { countries in
            completion(countries.map { MainViewModel(country: $0) })
        }
    }
}

