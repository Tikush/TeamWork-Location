//
//  MainViewController.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: CountriesListViewModelProtocol!
    private var dataSource: CountriesDataSource!
    private var countriesManager: CountriesManagerProtocol!
    
    private var countries: [MainViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureViewModel()
        
        tableView.allowsMultipleSelection = true
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    @IBAction func onToMapBtn(_ sender: Any) {
        print("tapped")
        coordinator?.proceedToMainPageMapViewController()
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
