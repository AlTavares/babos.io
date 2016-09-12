//
//  Cacheable.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/12/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import Haneke
import ObjectMapper
import Alamofire

protocol Cacheable {
    associatedtype Data: Mappable

}

extension Cacheable where Self: Gettable {

    func fetch(url: URLStringConvertible, cacheKey: String, completionHandler: Result<[Data]> -> Void) {
        let cache = Shared.JSONCache
        if !NetworkReachability.sharedInstance.isOnline {
            cache.fetch(key: cacheKey) { result in
                guard let object = Mapper<Data>().mapArray(result.array) else {
                    completionHandler(Result.failure("Can't get data from cache"))
                    return
                }
                completionHandler(Result.success(object))

            }
        }
        Alamofire.request(.GET, url, headers: Private.authHeader)
            .responseArray(keyPath: "results") { (response: Response<[Data], NSError>) in
                guard let result = response.result.value else {
                    return completionHandler(Result.failure(response.result.error!.description))
                }
                cache.set(value: result.toJSONObject(), key: cacheKey)
                completionHandler(Result.success(result))
        }
    }
}
