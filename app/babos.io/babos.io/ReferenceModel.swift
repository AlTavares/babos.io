//
//  ReferenceModel.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import ObjectMapper

struct Reference: Mappable {
    var name: [String]!
    var scientificName: [String]!
    var family: [String]!
    var parts: [String]!
    var interactions: [String]!
    var precautions: [String]!

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        scientificName <- map["scientificName"]
        family <- map["family"]
        parts <- map["parts"]
        interactions <- map["interactions"]
        precautions <- map["precautions"]
    }
}
