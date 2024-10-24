//
//  DetailPropertyRepresentable.swift
//  Idealista
//
//  Created by Jorge on 24/10/24.
//

import Foundation

struct DetailPropertyRepresentable: Hashable {
    let description: String
    let communityCosts: String
    let rooms: String
    let baths: String
    let boxroom: String
    let energyConsumption: String
    let emissions: String

    init(domainModel: DetailProperty) {
        self.description = domainModel.description
        self.communityCosts = domainModel.basicCharacteristics.communityCosts.formatToCurrency()
        self.rooms = "\(domainModel.basicCharacteristics.rooms)"
        self.baths = "\(domainModel.basicCharacteristics.baths)"
        self.boxroom = "\(domainModel.basicCharacteristics.boxroom)"
        self.energyConsumption = domainModel.energyCertification.energyConsumption
        self.emissions = domainModel.energyCertification.emissions
    }
}
