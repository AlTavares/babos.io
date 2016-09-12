//
//  ObjectMapperHanekeExtension.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/7/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import ObjectMapper
import Haneke

extension Array where Element: Mappable {
    func toJSONObject() -> JSON {
        return JSON.Array(self.toJSON())
    }
}

extension Mappable {
    func toJSONObject() -> JSON {
        return JSON.Dictionary(self.toJSON())
    }
}
