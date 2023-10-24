//
//  RatingViewTests.swift
//  WhatILearnedTests
//
//  Created by Ghadirian, Hamed, HSE DE on 23.10.23.
//
@testable import WhatILearned
import XCTest
import SwiftUI
import ViewInspector

final class RatingViewTests: XCTestCase {
    func test_initialization() throws {
        let sut = makeSUT()
        XCTAssertEqual(sut.stars().count, 5)

        XCTAssertEqual(starFillImage, sut.getStarImage(of: 0))
        XCTAssertEqual(starFillImage, sut.getStarImage(of: 1))
        XCTAssertEqual(starFillImage, sut.getStarImage(of: 2))
        XCTAssertEqual(starEmptyImage, sut.getStarImage(of: 3))
        XCTAssertEqual(starEmptyImage, sut.getStarImage(of: 4))
    }

    func test_tapOnStars() {
        var bindingValue = 3
        let binding = Binding(
            get: {
                bindingValue
            },
            set: {
                bindingValue = $0
            }
        )
        let sut = makeSUT(initRate: binding)
        XCTAssertEqual(bindingValue, 3)
        sut.tapOnStarImage(of: 0)
        XCTAssertEqual(bindingValue, 1)
        XCTAssertEqual(starFillImage, sut.getStarImage(of: 0))
        XCTAssertEqual(starEmptyImage, sut.getStarImage(of: 1))
        XCTAssertEqual(starEmptyImage, sut.getStarImage(of: 2))
        XCTAssertEqual(starEmptyImage, sut.getStarImage(of: 3))
        XCTAssertEqual(starEmptyImage, sut.getStarImage(of: 4))
    }

    // MARK: - Helper Methods
    private func makeSUT(
        initRate: Binding<Int> = .constant(3)
    ) -> RatingView {
        RatingView(viewModel: RatingViewModel(), rating: initRate)
    }
    private let starEmptyImage = Image(systemName: "star").resizable()
    private let starFillImage = Image(systemName: "star.fill").resizable()
}

// swiftlint:disable force_try
private extension RatingView {
    func stars() -> [InspectableView<ViewType.Image>] {
        try! inspect().findAll(ViewType.Image.self)
    }

    func getStarImage(of number: Int) -> Image {
        try! stars()[number].actualImage()
    }
    func tapOnStarImage(of number: Int) {
        try! stars()[number].callOnTapGesture()
    }
}
// swiftlint:enable force_try
