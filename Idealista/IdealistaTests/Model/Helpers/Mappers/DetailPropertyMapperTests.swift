//
//  DetailPropertyMapperTests.swift
//  IdealistaTests
//
//  Created by Jorge on 25/10/24.
//

import XCTest
@testable import Idealista

final class DetailPropertyMapperTests: XCTestCase {

    func test_DetailPropertyMapper_from_DetailPropertyDTO() {
        // given
        let property = DetailPropertyDTO(
            propertyComment: "Venta.Piso EN EXCLUSIVA. Castellana",
            ubication: DetailPropertyDTO
                .Ubication(
                    latitude: 123.456,
                    longitude: 87.654
                ),
            moreCharacteristics: DetailPropertyDTO
                .MoreCharacteristics(
                    communityCosts: 450.95,
                    roomNumber: 2,
                    bathNumber: 2,
                    boxroom: false
                ),
            energyCertification: DetailPropertyDTO
                .EnergyCertification(
                    title: "Title",
                    energyConsumption: DetailPropertyDTO.Emissions(type: "B"),
                    emissions: DetailPropertyDTO.Emissions(type: "C")
                )
        )
        // when
        let mapper = DetailPropertyMapperImpl()
        let detailProperty = mapper.map(from: property)
        // then
        XCTAssertEqual(detailProperty.description, "Venta.Piso EN EXCLUSIVA. Castellana")
        XCTAssertEqual(detailProperty.latitude, 123.456)
        XCTAssertEqual(detailProperty.longitude, 87.654)
        XCTAssertEqual(detailProperty.basicCharacteristics.communityCosts, 450.95)
        XCTAssertEqual(detailProperty.basicCharacteristics.rooms, 2)
        XCTAssertEqual(detailProperty.basicCharacteristics.baths, 2)
        XCTAssertEqual(detailProperty.basicCharacteristics.boxroom, false)
        XCTAssertEqual(detailProperty.energyCertification.title, "Title")
        XCTAssertEqual(detailProperty.energyCertification.energyConsumption, "B")
        XCTAssertEqual(detailProperty.energyCertification.emissions, "C")
    }
}

