//
//  InteractionsModel.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import ObjectMapper

struct RemumeItem: Mappable {
    var groupDescription: MultiLanguageString!
    var medicines: MultiLanguageArray!
    var group: String!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        groupDescription <- map["description"]
        medicines <- map["medicines"]
        group <- map["group"]
    }
    
}

