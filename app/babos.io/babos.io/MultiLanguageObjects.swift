//
//  MultiLanguageString.swift
//  babos.io
//
//  Created by Alexandre Mantovani Tavares on 9/4/16.
//  Copyright © 2016 Alexandre Mantovani Tavares. All rights reserved.
//

import Foundation
import ObjectMapper

protocol MultiLanguageObject: Mappable {
    associatedtype Element: CustomStringConvertible
    var pt: Element? {get set}
    var en: Element? {get set}
    var es: Element? {get set}
}

extension MultiLanguageObject {
    
    mutating func mapping(map: Map) {
        pt <- map["pt"]
        en <- map["en"]
        es <- map["es"]
    }
}

struct MultiLanguageString: MultiLanguageObject {

    typealias Element = String
    
    var pt: String?
    var en: String?
    var es: String?

    init?(map: Map) {

    }
    
    public var description: String {
        return pt!
    }
}

struct MultiLanguageArray: MultiLanguageObject {
    
    typealias Element = [String]
    
    var pt: [String]?
    var en: [String]?
    var es: [String]?
    var current: [String] {
        return pt!
    }
    
    init?(map: Map) {
        
    }
    
    public var description: String {
        return pt!.description
    }
}
