//
//  DetailProperty.swift
//  Idealista
//
//  Created by Jorge on 19/10/24.
//

import Foundation

struct DetailProperty {
    let description: String
    let latitude: Double
    let longitude: Double
    let basicCharacteristics: BasicCharacteristics
    let energyCertification: EnergyCertification
    
    struct BasicCharacteristics {
        let communityCosts: Double
        let rooms: Int
        let baths: Int
        let boxroom: Bool
    }
    
    struct EnergyCertification {
        let title: String
        let energyConsumption: String
        let emissions: String
    }
}
