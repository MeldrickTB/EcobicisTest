//
//  Extra.swift
//  Ecobicis Test
//
//  Created by Meldrick Trujeque on 16/12/23.
//

import Foundation

struct Extra: Decodable {
    let lastUpdated: Int
    let payment: [String]
    let paymentTerminal: Bool
    let renting: Int
    let returning: Int
    let slots: Int
    let uid: String
    
    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case payment
        case paymentTerminal = "payment-terminal"
        case renting
        case returning
        case slots
        case uid
    }
}
