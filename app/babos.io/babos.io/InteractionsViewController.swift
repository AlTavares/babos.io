//
//  ViewController.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

class InteractionsViewController: UIViewController, SearchableDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var filterableDataSource = FilterableDataSource<Plant>()
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBarController(delegate: self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        getPlants()
    }

    func getPlants()  {
        InteractionsService().get {[weak self] result in
            switch result {
            case .success(let plants):
                self?.filterableDataSource.dataSource = plants
                self?.tableView.reloadData()
            case .failure(let message):
                print("failure")
                print(message)
            }
        }
    }
    
    @IBAction func showSearchButton(_ sender: AnyObject) {
        self.showSearchBar()
    }
    
    func filterDataSource(text: String) {
        filterableDataSource.filter = { plant in
            return plant.name.description.lowercased().contains(text) ||
                   plant.scientificName.lowercased().contains(text)
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! InteractionDetailTableViewController
        vc.plant = sender as! Plant
    }

}

extension InteractionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterableDataSource.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlantTableViewCell.cellReuseIdentifier, for: indexPath) as! PlantTableViewCell
        cell.configureCell(plant: filterableDataSource.dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showInteractionDetail", sender: filterableDataSource.dataSource[indexPath.row])
    }
    
}

extension InteractionsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        initSearch(withText: searchBar.text)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        initSearch(withText: searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filterableDataSource.filtered = false
        tableView.reloadData()
    }
}

