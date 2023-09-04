//
//  StockRecordUtilityTests.swift
//  TwStockToolsTests
//
//  Created by cm0679 on 2023/9/3.
//

import XCTest
@testable import TwStockTools

final class StockRecordUtilityTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testCreateStockRecord() throws {
        
        /// 這個 test 是可以在還沒寫實作前先寫的
        /// 因為已經列出了測項，有測項就可以寫 test
        let result = StockRecordUtility().getStockRecord(stockID: "", stockName: "", tradingSide: .buy, stockShares: "", stockCostPerShare: "")
        
        /// 這邊的 Assert 也可以在還沒宣告對應的 Error 物件前先寫
        switch result {
            case .success(_):
                XCTFail("This test case not able success")
            case .failure(let failure):
                
                let error = try XCTUnwrap(failure as? StockRecordUtility.StockRecordInputError)
                XCTAssertEqual(error, StockRecordUtility.StockRecordInputError.noValue)
        }
    }
    
    func testTradingShareCannotConvertToInt() throws {
        
    
        let result = StockRecordUtility().getStockRecord(stockID: "0050", stockName: "元大50", tradingSide: .buy, stockShares: "a", stockCostPerShare: "130")
        
        switch result {
            case .success(_):
                XCTFail("This test case not able success")
            case .failure(let failure):
                
                let error = try XCTUnwrap(failure as? StockRecordUtility.StockRecordInputError)
                XCTAssertEqual(error, StockRecordUtility.StockRecordInputError.castingError)
        }
    }
    
    func testTradingCostPerShareConvertToInt() throws {
        
        let result = StockRecordUtility().getStockRecord(stockID: "0050", stockName: "元大50", tradingSide: .buy, stockShares: "1000", stockCostPerShare: "a")
        
        switch result {
            case .success(_):
                XCTFail("This test case not able success")
            case .failure(let failure):
                
                let error = try XCTUnwrap(failure as? StockRecordUtility.StockRecordInputError)
                XCTAssertEqual(error, StockRecordUtility.StockRecordInputError.castingError)
        }
    }
    
    func testTradingSharesBiggerThanZero() throws {
        
        let result = StockRecordUtility().getStockRecord(stockID: "0050", stockName: "元大50", tradingSide: .buy, stockShares: "-1000", stockCostPerShare: "130")
        
        switch result {
            case .success(_):
                XCTFail("This test case not able success")
            case .failure(let failure):
                
                let error = try XCTUnwrap(failure as? StockRecordUtility.StockRecordInputError)
                XCTAssertEqual(error, StockRecordUtility.StockRecordInputError.castingError)
        }
    }
    
    func testCostPerShareBiggerThanZero() throws {
        
        let result = StockRecordUtility().getStockRecord(stockID: "0050", stockName: "元大50", tradingSide: .buy, stockShares: "1000", stockCostPerShare: "-130")
        
        switch result {
            case .success(_):
                XCTFail("This test case not able success")
            case .failure(let failure):
                
                let error = try XCTUnwrap(failure as? StockRecordUtility.StockRecordInputError)
                XCTAssertEqual(error, StockRecordUtility.StockRecordInputError.castingError)
        }
    }
    
    func testStockRecordStockProperties() throws {
        
        let result = StockRecordUtility().getStockRecord(stockID: "0050", stockName: "元大50", tradingSide: .buy, stockShares: "1000", stockCostPerShare: "130")
        
        switch result {
            case .success(let record):
                
                XCTAssertEqual(record.stockID, "0050")
                XCTAssertEqual(record.stockName, "元大50")
                XCTAssertEqual(record.tradingSide, .buy)
                XCTAssertEqual(record.tradingShares, 1000)
                /// trading Amount 是交易總金額，所以是 1000 * 130 = 130000
                XCTAssertEqual(record.tradingAmount, 130000)
            case .failure(_):
                XCTFail("Test failed")
        }
    }
}
