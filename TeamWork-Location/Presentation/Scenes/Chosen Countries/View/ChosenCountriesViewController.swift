//
//  ChosenCountriesViewController.swift
//  TeamWork-Location
//
//  Created by Tiko on 07.07.21.
//

import UIKit

class ChosenCountriesViewController: BaseViewController {

    @IBOutlet weak var myTable: UITableView!
    private var dataSource: ChosenDataSource!
    private var viewModel: ChosenViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.register(ChosenCell.self, forCellReuseIdentifier: "ChosenCell")
        configureViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataSource.refresh()
    }

}

extension ChosenCountriesViewController {
    private func configureViewModel() {
        viewModel = ChosenViewModel(with: self)
        dataSource = ChosenDataSource(with: myTable, viewModel: viewModel)
        dataSource.refresh()
    }
}
