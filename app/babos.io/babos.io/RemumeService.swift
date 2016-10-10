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

struct RemumeService: Gettable, Cacheable {

    typealias Data = RemumeItem
    let path = "classes/Remume"

    public func get(_ completionHandler: @escaping (Result<[RemumeItem]>) -> Void) {
        let params = ["order" : "group"]
        fetch(fromURL: Environment.baseURL + path, fromCache: CacheKeys.RemumeList, parameters: params, encoding: URLEncoding.queryString, headers: Private.authHeaders, completionHandler: completionHandler)
    }

}

