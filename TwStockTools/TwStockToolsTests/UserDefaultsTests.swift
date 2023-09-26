//
//  UserDefaultsTests.swift
//  TwStockToolsTests
//
//  Created by cm0679 on 2023/9/20.
//

import XCTest
@testable import TwStockTools

class FakeUserDefaults: UserDefaultsProtocol {
    
    var integers: [String: Int] = [:]
    
    func set(_ value: Int, forKey defaultName: String) {
        integers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        integers[defaultName] ?? 0
    }
}
