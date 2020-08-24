//
//  UserModel.swift
//  E-Ticketing
//
//  Created by Muhammad  Naveed on 24/08/2020.
//  Copyright © 2020 technerds. All rights reserved.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let userType: String?
    let fares: [Fare]?
    let subtext: String?
}

// MARK: - Fare
struct Fare: Codable {
    let fareDescription: String?
    let price: Double?
    var priceFormatted: String? {
        return "$\(price?.toString ?? "--")"
    }
    
    enum CodingKeys: String, CodingKey {
        case fareDescription = "description"
        case price
    }
}


