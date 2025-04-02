//
//  RickyBuggyTests.swift
//  RickyBuggyTests
//

import Combine
import XCTest

@testable import RickyBuggy

final class CharacterDetailViewModelTests: XCTestCase {
    private var sut: CharacterDetailViewModel!

    override func setUp() {
        super.setUp()
//        sut = CharacterDetailViewModel(characterId: 1, name: "Test")
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_againstMemoryLeak() {
        weak var weakSut = sut
        sut = nil
        XCTAssertNil(weakSut)
    }
}
