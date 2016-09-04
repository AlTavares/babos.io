//
//  MultiLanguageString.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import ObjectMapper

struct MultiLanguageString: Mappable, CustomStringConvertible {
    var pt: String?
    var en: String?
    var es: String?

    init?(_ map: Map) {

    }

    mutating func mapping(map: Map) {
        pt <- map["pt"]
        en <- map["en"]
        es <- map["es"]
    }
    
    var description: String {
        return pt!
    }
}