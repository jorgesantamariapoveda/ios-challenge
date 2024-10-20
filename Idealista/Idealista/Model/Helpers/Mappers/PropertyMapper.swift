//
//  PropertyMapper.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

protocol PropertyMapper {
    func map(from dto: PropertyDTO) -> Property
}

final class PropertyMapperImpl: PropertyMapper {
    func map(from dto: PropertyDTO) -> Property {
        Property(
            id: "",
            imagesUrl: [],
            address: "",
            price: 1,
            currencySuffix: "",
            isParkingSpaceIncludedInPrice: true,
            rooms: 1,
            size: 2
        )
    }
}
