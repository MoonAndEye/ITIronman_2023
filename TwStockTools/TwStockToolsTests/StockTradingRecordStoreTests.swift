//
//  StockTradingRecordStoreTests.swift
//  TwStockToolsTests
//
//  Created by cm0679 on 2023/9/7.
//

import XCTest
@testable import TwStockTools

final class StockTradingRecordStoreTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    func testStockTradingRecordStorePublish() {
        
        let sut = StockTradingRecordStore()
        let publisherExpectation = expectation(description: "wait for publisher in \(#file)")
        
        var receivedRecords: [StockTradingRecord] = []
        let cancellable = sut.recordPublisher
            .dropFirst() /// 因為第一個送出來的是空陣列，要等到變化後，也就是第二個，送出來的才是加進去的 record
            .sink { records in
                receivedRecords = records
                publisherExpectation.fulfill()
            }
        
        let record = getRecord()
        sut.add(record)
        
        wait(for: [publisherExpectation], timeout: 1)
        cancellable.cancel()
        
        XCTAssertEqual(receivedRecords.first?.stockID, "0050")
    }
    
    private func getRecord() -> StockTradingRecord {
        
        StockTradingRecord(stockID: "0050", stockName: "元大50", tradingSide: .buy, tradingShares: 1000, tradingAmount: 120000, tradingDateStr: "2023-09-07")
    }
}
