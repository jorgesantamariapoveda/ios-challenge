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

struct PropertyRepresentableMock {
    static func create() -> PropertyRepresentable {
        let property = Property(
            id: "1",
            imagesUrl: [
                "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
                "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp",
                "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/79/6b/e0/1273036729.webp",
                "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/00/c5/91/1273036730.webp",
            ],
            address: "calle de Lagasca".capitalizeFirstWord(),
            priceAmount: 1195000.0,
            priceCurrencySuffix: "€",
            isParkingSpaceIncludedInPrice: true,
            rooms: 3,
            size: 133.0
        )
        return PropertyRepresentable(domainModel: property)
    }
}
