//
//  InteractionsModel.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import ObjectMapper

struct Plant: Mappable {
    var name: MultiLanguageString!
    var scientificName: String!
    var family: String!
    var parts: MultiLanguageString!
    var interactions: MultiLanguageString!
    var precautions: MultiLanguageString!
    var warnings: MultiLanguageString!
    var contraindications: MultiLanguageString!
    var interactionGroups: [String]!
    var references: Reference!

    init?(_ map: Map) {

    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        scientificName <- map["scientificName"]
        family <- map["family"]
        parts <- map["parts"]
        interactions <- map["interactions"]
        precautions <- map["precautions"]
        warnings <- map["warnings"]
        contraindications <- map["contraindications"]
        interactionGroups <- map["interactionGroups"]
        references <- map["references"]
    }
}
