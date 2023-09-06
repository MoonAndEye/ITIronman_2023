//
//  DateUtilityTests.swift
//  TwStockToolsTests
//
//  Created by cm0679 on 2023/9/5.
//

import XCTest
@testable import TwStockTools

final class DateUtilityTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    }
    
    /// 2023-09-05 05:09:55
    private var timeInterval: TimeInterval {
        1693890595
    }
    /// 2023-09-05 05:09:55
    private var date: Date {
        Date(timeIntervalSince1970: timeInterval)
    }
    
    /// 2023-09-06 01:43:45
    private var timeIntervale2: TimeInterval {
        1693964625
    }
    
    private var date2: Date {
        Date(timeIntervalSince1970: timeIntervale2)
    }

    func testDateToString() {
        
        let sut = DateUtility()
        let string = sut.getString(from: date)
        let answer = "2023-09-05"
        XCTAssertEqual(string, answer)
        
        let string2 = sut.getString(from: date2)
        let answer2 = "2023-09-06"
        XCTAssertEqual(string2, answer2)
    }
}
