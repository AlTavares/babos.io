//
//  GettableProtocol.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation

protocol Gettable {
    associatedtype Data
    func get(completionHandler: [Data] -> Void)
}