//
//  StockRecordTests.swift
//  TwStockToolsTests
//
//  Created by Marvin on 2023/9/1.
//

import XCTest
@testable import TwStockTools

final class StockRecordTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testStockTradingRecordInit() {
        
        let model = StockTradingRecord(stockID: "1101",
                                       stockName: "台泥",
                                       tradingSide: .buy,
                                       tradingShares: 1000,
                                       tradingAmount: 35000)
        
        XCTAssertEqual(model.stockID, "1101")
        XCTAssertEqual(model.stockName, "台泥")
        XCTAssertEqual(model.tradingSide, .buy)
        XCTAssertEqual(model.tradingShares, 1000)
        XCTAssertEqual(model.tradingAmount, 35000)
    }
    
    func testStockTradingRecordSell() {
        
        let model = StockTradingRecord(stockID: "1101",
                                       stockName: "台泥",
                                       tradingSide: .buy,
                                       tradingShares: -2000,
                                       tradingAmount: -70000)
        
        XCTAssertEqual(model.stockID, "1101")
        XCTAssertEqual(model.stockName, "台泥")
        XCTAssertEqual(model.tradingSide, .buy)
        XCTAssertEqual(model.tradingShares, -2000)
        XCTAssertEqual(model.tradingAmount, -70000)
    }
}
