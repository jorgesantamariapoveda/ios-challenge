//
//  PropertyDetail.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import Foundation

struct PropertyDetail {
    let imagesUrl: [String]
    let address: String
    let price: Double
    let currencySuffix: String
    let isParkingSpaceIncludedInPrice: Bool
    let rooms: Int
    let size: Double
    let description: String
    let latitude: Double
    let longitude: Double
    let basicCharacteristics: BasicCharacteristics
    let energyCertification: EnergyCertification
    
    struct BasicCharacteristics {
        let communityCosts: Double
        let rooms: Int
        let baths: Int
    }
    
    struct EnergyCertification {
        let title: String
        let energyConsumption: String
        let emissions: String
    }
}
