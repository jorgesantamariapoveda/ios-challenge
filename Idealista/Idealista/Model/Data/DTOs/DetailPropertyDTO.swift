//
//  DetailPropertyDTO.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

struct DetailPropertyDTO: Codable {
    let propertyComment: String
    let ubication: Ubication
    let moreCharacteristics: MoreCharacteristics
    let energyCertification: EnergyCertification
    
    struct EnergyCertification: Codable {
        let title: String
        let energyConsumption: Emissions
        let emissions: Emissions
    }
    
    struct Emissions: Codable {
        let type: String
    }
    
    struct MoreCharacteristics: Codable {
        let communityCosts: Double
        let roomNumber: Int
        let bathNumber: Int
        let boxroom: Bool
    }
    
    struct Ubication: Codable {
        let latitude, longitude: Double
    }
}
