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
    
    func fetch(fromURL url: URLConvertible, fromCache cacheKey: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding? = nil, headers: HTTPHeaders? = nil, completionHandler: @escaping (Result<[Data]>) -> Void) {
        
        fetch(fromCache: cacheKey, completionHandler: completionHandler)
        get(fromURL: url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        { result in
            completionHandler(result)
            if let data = result.value {
                if let json = data.toJSONString() {
                    let cache = Shared.stringCache
                    cache.set(value: json, key: cacheKey)
                }
            }
        }
    }
    
    func fetch(fromCache cacheKey: String, completionHandler: @escaping (Result<[Data]>) -> Void) {
        let cache = Shared.stringCache
        _ = cache.fetch(key: cacheKey).onSuccess { result in
            guard let object = Mapper<Data>().mapArray(JSONString: result) else {
                completionHandler(Result.failure("Can't get data from cache"))
                return
            }
            completionHandler(Result.success(object))
        }
    }
}

extension String: Error {}
