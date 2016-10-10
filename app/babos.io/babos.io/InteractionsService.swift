//
//  InteractionsService.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import Haneke
import ObjectMapper

struct InteractionsService: Gettable, Cacheable {

    typealias Data = Plant
    let path = "classes/Interaction"

    public func get(_ completionHandler: @escaping (Result<[Plant]>) -> Void) {
        let params = ["order" : "name"]
        fetch(fromURL: Environment.baseURL + path, fromCache: CacheKeys.Interactions, parameters: params, encoding: URLEncoding.queryString, headers: Private.authHeaders, completionHandler: completionHandler)
    }

}

