//
//  FoodAppTests.swift
//  FoodAppTests
//
//  Created by Michał Niemiec on 17/05/2022.
//

import XCTest
@testable import FoodApp

class FoodAppTests: XCTestCase {

    var sut: DataProviderProtocol!

    override func setUp() async throws {
        sut = MockDataProvider()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testThatFetchingPhotosWorking() async {
        let items = await sut.fetchFoods()
        XCTAssertFalse(items.isEmpty)
    }

    func testThatFirstPhotoIDIsEqualOne() async throws {
        let food = await sut.fetchFoods()
        let item = try XCTUnwrap(food.first)
        XCTAssertEqual(item.calories, 29)
    }
}

