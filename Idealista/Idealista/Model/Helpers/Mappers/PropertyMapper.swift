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
        let imagesUrl = dto.multimedia.images.map { $0.url }
        
        let isParkingSpaceIncludedInPrice: Bool
        if let parkingSpace = dto.parkingSpace,
           parkingSpace.hasParkingSpace,
           parkingSpace.isParkingSpaceIncludedInPrice {
            isParkingSpaceIncludedInPrice = true
        } else {
            isParkingSpaceIncludedInPrice = false
        }
        
        return Property(
            id: dto.propertyCode,
            imagesUrl: imagesUrl,
            address: dto.address.capitalizeFirstWord(),
            priceAmount: dto.priceInfo.price.amount,
            priceCurrencySuffix: dto.priceInfo.price.currencySuffix,
            isParkingSpaceIncludedInPrice: isParkingSpaceIncludedInPrice,
            rooms: dto.rooms,
            size: dto.size
        )
    }
}
