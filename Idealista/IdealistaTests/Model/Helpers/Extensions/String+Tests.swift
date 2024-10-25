//
//  String+Tests.swift
//  IdealistaTests
//
//  Created by Jorge on 25/10/24.
//

import XCTest
@testable import Idealista

final class String_Tests: XCTestCase {

    func test_capitalizeFirstWord_all_words_start_lowercase_success() {
        // given
        let value = "calle la laguna"
        // when
        let format = value.capitalizeFirstWord()
        // then
        XCTAssertEqual(format, "Calle la laguna")
    }

    func test_capitalizeFirstWord_all_words_start_lowercase_fall() {
        // given
        let value = "calle la laguna"
        // when
        let format = value.capitalizeFirstWord()
        // then
        XCTAssertNotEqual(format, "Calle La Laguna")
        XCTAssertNotEqual(format, "Calle la Laguna")
        XCTAssertNotEqual(format, "Calle la Laguna")
    }
}
