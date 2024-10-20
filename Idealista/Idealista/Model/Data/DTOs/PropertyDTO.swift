//
//  PropertyDTO.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

struct PropertyDTO: Codable {
    let propertyCode: String
    let priceInfo: PriceInfo
    let size: Double
    let rooms: Int
    let address: String
    let latitude: Double
    let longitude: Double
    let multimedia: Multimedia
    let parkingSpace: ParkingSpace?
}

struct Multimedia: Codable {
    let images: [Image]
}

struct Image: Codable {
    let url: String
    let tag: String
}

struct ParkingSpace: Codable {
    let hasParkingSpace: Bool
    let isParkingSpaceIncludedInPrice: Bool
}

struct PriceInfo: Codable {
    let price: Price
}

struct Price: Codable {
    let amount: Double
    let currencySuffix: String
}
