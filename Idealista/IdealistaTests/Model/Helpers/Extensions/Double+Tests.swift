//
//  DoubleTests.swift
//  IdealistaTests
//
//  Created by Jorge on 25/10/24.
//

import XCTest
@testable import Idealista

final class DoubleTests: XCTestCase {

    func test_formatToCurrencyWithoutCurrencySymbol_when_lessThanOrEqualTo_thousands_success() {
        // given
        let value = 3.356
        // when
        let format = value.formatToCurrencyWithoutCurrencySymbol()
        // then
        XCTAssertEqual(format, "3,356")
    }

    func test_formatToCurrencyWithoutCurrencySymbol_when_lessThanOrEqualTo_thousands_fall() {
        // given
        let value = 3.356
        // when
        let format = value.formatToCurrencyWithoutCurrencySymbol()
        // then
        XCTAssertNotEqual(format, "3.356")
    }

    func test_formatToCurrencyWithoutCurrencySymbol_when_greaterThanOrEqualTo_thousands_success() {
        // given
        let value: Double = 1200
        // when
        let format = value.formatToCurrencyWithoutCurrencySymbol()
        // then
        XCTAssertEqual(format, "1.200")
    }

    func test_formatToCurrencyWithoutCurrencySymbol_when_greaterThanOrEqualTo_thousands_fall() {
        // given
        let value: Double = 1200
        // when
        let format = value.formatToCurrencyWithoutCurrencySymbol()
        // then
        XCTAssertNotEqual(format, "1,200")
    }
}
