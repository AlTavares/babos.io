
//
//  SearchableDataSource.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 16/10/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import UIKit

protocol SearchableDataSource: class {
    associatedtype DataType
    var searchController: UISearchController! {get set}
    var filterableDataSource: FilterableDataSource<DataType> {get set}
    func filterDataSource(text: String)
}

extension SearchableDataSource where Self: UIViewController {
    
    func setSearchBarController(delegate: UISearchBarDelegate) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.delegate = delegate
        searchController.searchBar.tintColor = self.navigationController?.navigationBar.tintColor
        searchController.searchBar.barTintColor = self.navigationController?.navigationBar.barTintColor
        for subView in searchController.searchBar.subviews[0].subviews where subView is UITextField {
            subView.tintColor = UIColor.darkText
        }
    }
    
    func showSearchBar() {
        searchController.searchBar.placeholder = "Busca"
        present(searchController, animated: true, completion: nil)
    }
    
    func initSearch(withText text: String?) {
        if let text = searchController.searchBar.text, text != "" {
            filterableDataSource.filtered = true
            filterDataSource(text: text.lowercased())
            return
        }
        filterableDataSource.filtered = false
    }
    
}
