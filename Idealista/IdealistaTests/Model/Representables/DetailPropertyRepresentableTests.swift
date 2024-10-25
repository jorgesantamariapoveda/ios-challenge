//
//  DetailPropertyRepresentableTests.swift
//  IdealistaTests
//
//  Created by Jorge on 25/10/24.
//

import XCTest
@testable import Idealista

final class DetailPropertyRepresentableTests: XCTestCase {

    func test_initDetailPropertyRepresentable_from_domainModel_DetailProperty() {
        // given
        let description = "Venta.Piso EN EXCLUSIVA. Castellana."
        
        let basicCharacteristics = DetailProperty.BasicCharacteristics(
            communityCosts: 245.99,
            rooms: 3,
            baths: 2,
            boxroom: true
        )
        
        let energyCertification = DetailProperty.EnergyCertification(
            title: "Certificado energético",
            energyConsumption: "A",
            emissions: "B"
        )
        
        let property = DetailProperty(
            description: description,
            latitude: 40.4362687,
            longitude: -3.6833686,
            basicCharacteristics: basicCharacteristics,
            energyCertification: energyCertification
        )
        // when
        let representable = DetailPropertyRepresentable(domainModel: property)
        // then
        XCTAssertEqual(representable.description, "Venta.Piso EN EXCLUSIVA. Castellana.")
        XCTAssertEqual(representable.communityCosts, "· Costes de comunidad 245,99 €")
        XCTAssertEqual(representable.rooms, "· 3 habitaciones")
        XCTAssertEqual(representable.baths, "· 2 baños")
        XCTAssertEqual(representable.boxroom, "· Trastero")
        XCTAssertEqual(representable.energyConsumption, "· Consumo: A")
        XCTAssertEqual(representable.emissions, "· Emisiones: B")
    }

    func test_initDetailPropertyRepresentable_from_domainModel_DetailProperty_2() {
        // given
        let description = "Venta.Piso EN EXCLUSIVA. Castellana."
        
        let basicCharacteristics = DetailProperty.BasicCharacteristics(
            communityCosts: 3245.99,
            rooms: 3,
            baths: 2,
            boxroom: false
        )
        
        let energyCertification = DetailProperty.EnergyCertification(
            title: "Certificado energético",
            energyConsumption: "A",
            emissions: "B"
        )
        
        let property = DetailProperty(
            description: description,
            latitude: 40.4362687,
            longitude: -3.6833686,
            basicCharacteristics: basicCharacteristics,
            energyCertification: energyCertification
        )
        // when
        let representable = DetailPropertyRepresentable(domainModel: property)
        // then
        XCTAssertEqual(representable.description, "Venta.Piso EN EXCLUSIVA. Castellana.")
        XCTAssertEqual(representable.communityCosts, "· Costes de comunidad 3.245,99 €")
        XCTAssertEqual(representable.rooms, "· 3 habitaciones")
        XCTAssertEqual(representable.baths, "· 2 baños")
        XCTAssertNil(representable.boxroom)
        XCTAssertEqual(representable.energyConsumption, "· Consumo: A")
        XCTAssertEqual(representable.emissions, "· Emisiones: B")
    }
}

