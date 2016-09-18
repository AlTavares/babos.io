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
    associatedtype Data
    
}

extension Cacheable where Self: Gettable, Self.Data: Mappable {
    
    func fetch(fromUrl url: String, fromCache cacheKey: String, completionHandler: @escaping (Result<[Data]>) -> Void) {
        fetch(fromCache: cacheKey, completionHandler: completionHandler)
        if NetworkReachability.sharedInstance.isOnline {
            fetch(fromURL: url) { result in
                completionHandler(result)
                if let data = result.value {
                    let cache = Shared.JSONCache
                    cache.set(value: data.toJSONObject(), key: CacheKeys.Interactions)
                }
            }
        }
    }
    
    func fetch(fromCache cacheKey: String, completionHandler: @escaping (Result<[Data]>) -> Void) {
        let cache = Shared.JSONCache
        _ = cache.fetch(key: cacheKey).onSuccess { result in
            guard let object = Mapper<Data>().map(JSON: result.dictionary) else {
                completionHandler(Result.failure("Can't get data from cache"))
                return
            }
            let a = Result.success(object)
            print(a)
//            completionHandler(Result.success(object))
        }
    }
}

extension String: Error {}
