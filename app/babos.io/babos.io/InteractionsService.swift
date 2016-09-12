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

    func get(completionHandler: Result<[Plant]> -> Void) {
        fetch(Environment.baseURL + path, cacheKey: CacheKeys.Interactions, completionHandler: completionHandler)
    }

}

