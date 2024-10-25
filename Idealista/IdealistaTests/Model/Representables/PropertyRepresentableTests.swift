//
//  PropertyRepresentableTests.swift
//  IdealistaTests
//
//  Created by Jorge on 25/10/24.
//

import XCTest
@testable import Idealista

final class PropertyRepresentableTests: XCTestCase {

    func test_initPropertyRepresentable_from_domainModel_Property() {
        // given
        let property = Property(
            id: "1",
            imagesUrl: [
                "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
            ],
            address: "calle de Lagasca".capitalizeFirstWord(),
            priceAmount: 1195000.0,
            priceCurrencySuffix: "€",
            isParkingSpaceIncludedInPrice: true,
            rooms: 3,
            size: 133.0
        )
        // when
        let representable = PropertyRepresentable(domainModel: property)
        // then
        XCTAssertEqual(representable.id, "1")
        XCTAssertEqual(representable.imagesUrl.count, 1)
        XCTAssertEqual(representable.address, "Calle de Lagasca")
        XCTAssertEqual(representable.price, "1.195.000 €")
        XCTAssertEqual(representable.isParkingSpaceIncludedInPrice, true)
        XCTAssertEqual(representable.rooms, "3 hab")
        XCTAssertEqual(representable.size, "133.0 m²")
    }
}

