//
//  FooViewControllerTests.swift
//  LaunchProjUITests
//
//  Created by cm0679 on 2023/10/7.
//

import XCTest
@testable import LaunchProj

final class FooViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        
    }

    func testFooVCLoading() throws {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: FooViewController = sb.instantiateViewController(identifier: String(describing: FooViewController.self))
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.fooLabel)
    }
}
