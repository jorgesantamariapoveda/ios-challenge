//
//  Property.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import Foundation

struct Property {
    let id: String
    let imagesUrl: [String]
    let address: String
    let price: Double
    let currencySuffix: String
    let isParkingSpaceIncludedInPrice: Bool
    let rooms: Int
    let size: Double
}
