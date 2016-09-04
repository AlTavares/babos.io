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

struct InteractionsService: Gettable {
    let path = "classes/Interaction"

    func get(completionHandler: Result<[Plant]> -> Void) {
        Alamofire.request(.GET, Environment.baseURL + path, headers: Private.authHeader)
            .responseArray(keyPath: "results") { (response: Response<[Plant], NSError>) in
                debugPrint(response)
                guard let result = response.result.value else {
                    return completionHandler(Result.failure(response.result.error!.description))
                }
                completionHandler(Result.success(result))
        }
    }
}