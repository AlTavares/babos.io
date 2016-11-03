//
//  Environment.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation

enum Environment {
    //static let host = "http://localhost:3000/"
    static let host = "https://babosio.herokuapp.com/"
    static let baseURL = "\(host)parse/"
    static let authHeaders = [
        "X-Parse-Application-Id": "jmPkI2X4zgwP7M5G74y8u97tJvlCyBAe"
    ]

}
