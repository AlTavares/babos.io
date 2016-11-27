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
    var interactionGroups: [String]?
    var references: Reference!
    var imageUrl: URL?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        scientificName <- map["scientificName"]
        family <- map["family"]
        parts <- map["parts"]
        interactions <- map["interactions"]
        precautions <- map["precautions"]
        interactionGroups <- map["interactionGroups"]
        references <- map["references"]
        imageUrl <- (map["image.url"], URLTransform())
    }
}

