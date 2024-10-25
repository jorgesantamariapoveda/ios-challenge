//
//  PropertyMapperTests.swift
//  IdealistaTests
//
//  Created by Jorge on 25/10/24.
//

import XCTest
@testable import Idealista

final class PropertyMapperTests: XCTestCase {

    func test_PropertyMapper_from_PropertyMapperTests() {
        // given
        let propertyDTO = PropertyDTO(
            propertyCode: "123",
            priceInfo: PropertyDTO
                .PriceInfo(
                    price: PropertyDTO
                        .Price(
                        amount: 34.67,
                        currencySuffix: "$"
                    )
                ),
            size: 76.54,
            rooms: 3,
            address: "Paseo de los tests",
            latitude: 12.34,
            longitude: 56.78,
            multimedia: PropertyDTO
                .Multimedia(
                    images: []
                ),
            parkingSpace: nil
        )
        // when
        let mapper = PropertyMapperImpl()
        let detailProperty = mapper.map(from: propertyDTO)
        // then
        XCTAssertEqual(detailProperty.id, "123")
        XCTAssertEqual(detailProperty.imagesUrl.count, 0)
        XCTAssertEqual(detailProperty.address, "Paseo de los tests")
        XCTAssertEqual(detailProperty.priceAmount, 34.67)
        XCTAssertEqual(detailProperty.priceCurrencySuffix, "$")
        XCTAssertEqual(detailProperty.isParkingSpaceIncludedInPrice, false)
        XCTAssertEqual(detailProperty.rooms, 3)
        XCTAssertEqual(detailProperty.size, 76.54)
    }
}

