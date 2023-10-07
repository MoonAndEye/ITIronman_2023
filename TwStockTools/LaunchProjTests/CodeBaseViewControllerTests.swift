//
//  CodeBaseViewControllerTests.swift
//  LaunchProjTests
//
//  Created by cm0679 on 2023/10/7.
//

import XCTest
@testable import LaunchProj

final class CodeBaseViewControllerTests: XCTestCase {
    
    var sut: CodeBasedViewController!

    override func setUpWithError() throws {
        sut = CodeBasedViewController(dataString: "foo")
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFooBaseVC() {
        XCTAssertEqual(sut.dataString, "foo")
    }
}
