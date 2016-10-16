//
//  FilterableDataSource.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 16/10/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation

struct FilterableDataSource<DataType> {
    var filtered = false
    var filter: ((DataType) -> Bool)? {
        willSet {
            if let filter = newValue {
                self.filteredDataSource = fullDataSource.filter(filter)
            }
        }
    }
    private var filteredDataSource = [DataType]()
    private var fullDataSource = [DataType]()
    
    var dataSource: [DataType] {
        get {
            if (filtered && filter != nil) {
                return filteredDataSource
            }
            return fullDataSource
        }
        set {
            fullDataSource = newValue
            if let filter = filter {
                self.filteredDataSource = newValue.filter(filter)
            }
        }
    }

}
