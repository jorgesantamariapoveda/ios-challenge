//
//  PropertyRepresentable.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

struct PropertyRepresentable: Hashable {
    let id: String
    let imagesUrl: [String]
    let address: String
    let price: String
    let isParkingSpaceIncludedInPrice: Bool
    let rooms: String
    let size: String
    
    init(domainModel: Property) {
        self.id = domainModel.id
        self.imagesUrl = domainModel.imagesUrl
        self.address = domainModel.address
        self.price = "\(domainModel.priceAmount.formatToCurrencyWithoutCurrencySymbol()) \(domainModel.priceCurrencySuffix)"
        self.isParkingSpaceIncludedInPrice = domainModel.isParkingSpaceIncludedInPrice
        self.rooms = "\(domainModel.rooms) hab"
        self.size = "\(domainModel.size) m²"
    }
}
