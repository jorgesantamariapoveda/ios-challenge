//
//  DetailPropertyMapper.swift
//  Idealista
//
//  Created by Jorge on 20/10/24.
//

import Foundation

protocol DetailPropertyMapper {
    func map(from dto: DetailPropertyDTO) -> DetailProperty
}

final class DetailPropertyMapperImpl: DetailPropertyMapper {
    
    func map(from dto: DetailPropertyDTO) -> DetailProperty {
        DetailProperty(
            description: dto.propertyComment,
            latitude: dto.ubication.latitude,
            longitude: dto.ubication.longitude,
            basicCharacteristics: map(from: dto.moreCharacteristics),
            energyCertification: map(from: dto.energyCertification)
        )
    }
    
    private func map(from more: DetailPropertyDTO.MoreCharacteristics) -> DetailProperty.BasicCharacteristics {
        .init(
            communityCosts: more.communityCosts,
            rooms: more.roomNumber,
            baths: more.bathNumber,
            boxroom: more.boxroom
        )
    }
    
    private func map(from energy: DetailPropertyDTO.EnergyCertification) -> DetailProperty.EnergyCertification {
        .init(
            title: energy.title,
            energyConsumption: energy.energyConsumption.type,
            emissions: energy.emissions.type
        )
    }
}
