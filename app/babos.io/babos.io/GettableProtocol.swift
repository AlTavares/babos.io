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
}

extension Gettable where Self.Data: Mappable {
    func get(fromURL url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding? = nil, headers: HTTPHeaders? = nil, completionHandler: @escaping (Result<[Data]>) -> Void) {
        let request: DataRequest
        
        if let encoding = encoding {
            request = Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        } else {
            request = Alamofire.request(url, method: method, parameters: parameters, headers: headers)
        }
        let r = request.responseArray(keyPath: "results") { (response: DataResponse<[Data]>) in
            completionHandler(response.result)
        }
        debugPrint(r)
    }
}
