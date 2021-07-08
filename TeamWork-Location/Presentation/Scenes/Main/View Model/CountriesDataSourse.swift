//
//  CountriesDataSourse.swift
//  TeamWork-Location
//
//  Created by Teo Elisashvili on 08.07.21.
//

import UIKit

class CountriesDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    private var viewModel: CountriesListViewModelProtocol!
    private var countriesList = [MainViewModel]()
    private var filteredCountriesList = [MainViewModel]()
    
    init(with tableView: UITableView, viewModel: CountriesListViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.viewModel = viewModel
    }

    func refresh() {
        viewModel.getCountriesList { countries in
            self.countriesList.append(contentsOf: countries)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.configure(with: countriesList[indexPath.row])
        return cell
    }
}

