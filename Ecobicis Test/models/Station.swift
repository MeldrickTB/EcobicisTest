//
//  Station.swift
//  Ecobicis Test
//
//  Created by Meldrick Trujeque on 16/12/23.
//

import Foundation

struct Station: Decodable {
    let emptySlots: Int
    let extra: Extra
    let freeBikes: Int
    let id: String
    let latitude: Double
    let longitude: Double
    let name: String
    let timestamp: String
    
    enum CodingKeys: String, CodingKey {
        case emptySlots = "empty_slots"
        case extra
        case freeBikes = "free_bikes"
        case id
        case latitude
        case longitude
        case name
        case timestamp
    }
}
