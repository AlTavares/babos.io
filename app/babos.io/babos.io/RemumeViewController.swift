//
//  ViewController.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

protocol ContentSizeDelegate {
    func contentSizeDidChange(size: CGSize)
}

class RemumeViewController: UIViewController, SearchableDataSource {
    @IBOutlet weak var tableView: UITableView!
    var contentSizeDelegate: ContentSizeDelegate?
    var filterableDataSource = FilterableDataSource<RemumeItem>()
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBarController(delegate: self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
        getRemumeList()
    }
    
    func getRemumeList()  {
        RemumeService().get {[weak self] result in
            switch result {
            case .success(let list):
                self?.filterableDataSource.dataSource = list
                self?.reloadTableView()
            case .failure(let message):
                print("failure")
                print(message)
            }
        }
    }
    
    func filterDataSource(text: String) {
        filterableDataSource.filter = { item in
            return item.group.lowercased().contains(text) ||
                item.groupDescription.description.lowercased().contains(text) ||
                self.containsMedication(item: item, searchText: text)
        }
        tableView.reloadData()
    }
    
    func containsMedication(item: RemumeItem ,searchText: String) -> Bool {
        guard let meds = item.medicines.current else {
            return false
        }
        for med in meds {
            if med.lowercased().contains(searchText) {
                return true
            }
        }
        return false
    }
    
    @IBAction func showSearchButton(_ sender: AnyObject) {
        showSearchBar()
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
        self.tableView.layoutIfNeeded()
        self.contentSizeDelegate?.contentSizeDidChange(size: self.tableView.contentSize)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? InteractionsViewController {
            let item = sender as! RemumeItem
            vc.searchButton.isEnabled = false
            vc.searchButton.tintColor = UIColor.clear
            vc.filterableDataSource.filtered = true
            vc.filterableDataSource.filter = { plant in
                guard let groups = plant.interactionGroups else {
                    return false
                }
                return groups.contains(item.group)
            }

        }
    }
    
}

extension RemumeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterableDataSource.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RemumeItemTableViewCell.cellReuseIdentifier, for: indexPath) as! RemumeItemTableViewCell
        cell.configureCell(item: filterableDataSource.dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowPlants", sender: filterableDataSource.dataSource[indexPath.row])
    }

}

extension RemumeViewController: UISearchBarDelegate {
    
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
