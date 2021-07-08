//
//  MainViewController.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: CountriesListViewModelProtocol!
    private var dataSource: CountriesDataSource!
    private var countriesManager: CountriesManagerProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()
    }
    
    private func setupLayout() {
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
    }
    
    private func configureViewModel() {
        countriesManager = CountriesManager()
        viewModel = CountriesListViewModel(with: countriesManager)
        dataSource = CountriesDataSource(with: tableView,
                                         viewModel: viewModel)
        dataSource.refresh()
    }
}
