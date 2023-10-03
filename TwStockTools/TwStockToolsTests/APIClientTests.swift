//
//  APIClientTests.swift
//  TwStockToolsTests
//
//  Created by cm0679 on 2023/9/26.
//

import XCTest
@testable import TwStockTools

final class APIClientTests: XCTestCase {
    
    var sut: APIClient!

    override func setUpWithError() throws {
        sut = APIClient()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    /// 測試每日收盤價與月均價
    /// https://openapi.twse.com.tw/v1/exchangeReport/STOCK_DAY_AVG_ALL
    func testClosePriceAndMonthlyAvgPrice() async throws {
        
        let url = try XCTUnwrap(URL(string: "https://openapi.twse.com.tw/v1/exchangeReport/STOCK_DAY_AVG_ALL"))
        let urlSessionMock = URLSessionProtocolMock()
        
        let expectedStockInfos = [StockDailyInfoElement(code: "0050", name: "元大台灣50", closingPrice: "123.55", monthlyAveragePrice: "125.16")]
        
        urlSessionMock.dataForDelegateReturnValue = (try JSONEncoder().encode(expectedStockInfos), HTTPURLResponse(url: url, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!)
        
        sut.session = urlSessionMock
        
        let stocks = try await sut.getStockClosPriceList()
        
        XCTAssertEqual(stocks, expectedStockInfos)
    }
    
    func testErrorHandleOnURLSessionProtocolMock() async throws {
        
        let urlSessionMock = URLSessionProtocolMock()
        let expect = NSError(domain: "", code: 1234)
        urlSessionMock.dataForDelegateError = expect
        sut.session = urlSessionMock
        do {
            _ = try await sut.getStockClosPriceList()
            XCTFail("this test should get error")
        } catch {
            let nsError = try XCTUnwrap(error as NSError)
            XCTAssertEqual(nsError, expect)
        }
    }
    
    func testStockClosePriceListDecodeError() async throws {
        
        let url = try XCTUnwrap(URL(string: "foo"))
        let urlSessionMock = URLSessionProtocolMock()
        urlSessionMock.dataForDelegateReturnValue = (
            try JSONEncoder().encode("dummyObject"),
            HTTPURLResponse(url: url, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
        )
        sut.session = urlSessionMock
        
        do {
            _ = try await sut.getStockClosPriceList()
            XCTFail("this test should not get here")
        } catch {
            XCTAssertTrue(error is Swift.DecodingError)
        }
    }

}
