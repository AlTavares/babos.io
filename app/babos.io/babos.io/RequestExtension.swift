//
//  RequestExtension.swift
//  Alamofire response inspector
//
//  Created by Alexandre Mantovani Tavares on 11/16/15.
//  Copyright © 2015. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {
    @discardableResult
    public func responseInspector() -> Self {
        return responseJSON { response in
            debugPrint(response.request) // original URL request
            debugPrint(response.response) // URL response
            debugPrint(response.data) // server data
            debugPrint(response.result) // result of response serialization
            print("")
        }
    }

}
