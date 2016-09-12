//
//  NetworkReachability.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/7/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkReachability {
    static let sharedInstance: NetworkReachability = NetworkReachability()
    let manager: NetworkReachabilityManager = NetworkReachabilityManager(host: Environment.host)!

    func startListening() {
        manager.listener = { status in
            print("Network Status Changed: \(status)")
        }

        manager.startListening()
    }
    
    var isOnline: Bool{
        return manager.isReachable
    }

}