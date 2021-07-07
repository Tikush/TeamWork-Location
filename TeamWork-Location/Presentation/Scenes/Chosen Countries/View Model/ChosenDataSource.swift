//
//  ChosenDataSource.swift
//  TeamWork-Location
//
//  Created by Baxva Jakeli on 07.07.21.
//

import UIKit

class ChosenDataSource: NSObject, UITableViewDataSource {

    private var tableView: UITableView!
    private var viewModel: ChosenViewModelProtocol!
    
    private var countries = [Country]()
    
    init(with tableView: UITableView, viewModel: ChosenViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return countries.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChosenCell") as! ChosenCell
//        cell.countriesLabel.text = countries[indexPath.row].name
        return cell 
    }
    
    func refresh() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}


extension ChosenDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.controller.coordinator?.proceedToChosenMapsViewController(with: countries[indexPath.row])
//        let vc = ChosenMapsViewController.instantiateFromStoryboard()
//        navigationController.isNavigationBarHidden = true
//        navigationController.pushViewController(vc, animated: true)
        print("Moved")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
