//
//  Network.swift
//  Ecobicis Test
//
//  Created by Meldrick Trujeque on 16/12/23.
//

import Foundation

struct Network: Decodable {
    let company: [String]
    let gbfsHref: String
    let href: String
    let id: String
    let location: Location
    let name: String
    let stations: [Station]
    
    enum CodingKeys: String, CodingKey {
        case company
        case gbfsHref = "gbfs_href"
        case href
        case id
        case location
        case name
        case stations
    }
}
