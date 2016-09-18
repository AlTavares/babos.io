//
//  GettableProtocol.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import Haneke

protocol Gettable {
    associatedtype Data
    func get(_ completionHandler: @escaping (Result<[Data]>) -> Void)
}

extension Gettable where Self.Data: Mappable {
    func fetch(fromURL url: String, completionHandler: @escaping (Result<[Data]>) -> Void) {
        Alamofire.request(url, headers: Private.authHeader)
            .responseInspector()
            .responseArray(keyPath: "results") { (response: DataResponse<[Data]>) in
                completionHandler(response.result)
        }
    }
}
