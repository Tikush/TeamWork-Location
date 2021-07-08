//
//  CountriesManager.swift
//  TeamWork-Location
//
//  Created by Teo Elisashvili on 08.07.21.
//

import UIKit

protocol CountriesManagerProtocol: AnyObject {
    func fetchCountries(completion: @escaping (([Country]) -> Void))
}

class CountriesManager: CountriesManagerProtocol {
    
    func fetchCountries(completion: @escaping (([Country]) -> Void)) {
        let url = "https://restcountries.eu/rest/v2/all"
//        let url = "https://restcountries.eu/rest/v2/region/Americas"
        NetworkManager.shared.get(with: url) { (result: Result<[Country], Error>) in
            switch result {
            case .success(let countries):
                completion(countries)
            case .failure(let error):
                print(error)
            }
        }
    }
}
