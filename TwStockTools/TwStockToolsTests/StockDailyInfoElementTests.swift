//
//  StockDailyInfoElementTests.swift
//  TwStockToolsTests
//
//  Created by cm0679 on 2023/9/27.
//

import XCTest
@testable import TwStockTools

final class StockDailyInfoElementTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testStockDailyInfoList() throws {
        
        let data = getData()
        
        let list = try JSONDecoder().decode(StockDailyInfo.self, from: data)
        XCTAssertEqual(list.count, 71)
    }
    
    func testStockDailyInfoElement() throws {
        let data = getData()
        
        let list = try JSONDecoder().decode(StockDailyInfo.self, from: data)
        let model = try XCTUnwrap(list.first)
        
        XCTAssertEqual(model.name, "元大台灣50")
        XCTAssertEqual(model.closingPrice, "123.55")
        XCTAssertEqual(model.code, "0050")
        XCTAssertEqual(model.monthlyAveragePrice, "125.16")
    }

    private func getData() -> Data {
        
        let string =
#"""
[
    {
        "Code": "0050",
        "Name": "元大台灣50",
        "ClosingPrice": "123.55",
        "MonthlyAveragePrice": "125.16"
    },
    {
        "Code": "0051",
        "Name": "元大中型100",
        "ClosingPrice": "70.55",
        "MonthlyAveragePrice": "70.12"
    },
    {
        "Code": "0052",
        "Name": "富邦科技",
        "ClosingPrice": "114.25",
        "MonthlyAveragePrice": "115.94"
    },
    {
        "Code": "0053",
        "Name": "元大電子",
        "ClosingPrice": "66.75",
        "MonthlyAveragePrice": "67.43"
    },
    {
        "Code": "0055",
        "Name": "元大MSCI金融",
        "ClosingPrice": "23.47",
        "MonthlyAveragePrice": "23.52"
    },
    {
        "Code": "0056",
        "Name": "元大高股息",
        "ClosingPrice": "35.08",
        "MonthlyAveragePrice": "35.16"
    },
    {
        "Code": "0057",
        "Name": "富邦摩台",
        "ClosingPrice": "91.15",
        "MonthlyAveragePrice": "92.21"
    },
    {
        "Code": "0061",
        "Name": "元大寶滬深",
        "ClosingPrice": "17.81",
        "MonthlyAveragePrice": "17.94"
    },
    {
        "Code": "006203",
        "Name": "元大MSCI台灣",
        "ClosingPrice": "60.15",
        "MonthlyAveragePrice": "60.76"
    },
    {
        "Code": "006204",
        "Name": "永豐臺灣加權",
        "ClosingPrice": "86.10",
        "MonthlyAveragePrice": "87.03"
    },
    {
        "Code": "006205",
        "Name": "富邦上証",
        "ClosingPrice": "30.61",
        "MonthlyAveragePrice": "30.53"
    },
    {
        "Code": "006206",
        "Name": "元大上證50",
        "ClosingPrice": "29.37",
        "MonthlyAveragePrice": "29.20"
    },
    {
        "Code": "006207",
        "Name": "復華滬深",
        "ClosingPrice": "23.56",
        "MonthlyAveragePrice": "23.65"
    },
    {
        "Code": "006208",
        "Name": "富邦台50",
        "ClosingPrice": "71.45",
        "MonthlyAveragePrice": "72.33"
    },
    {
        "Code": "00631L",
        "Name": "元大台灣50正2",
        "ClosingPrice": "129.45",
        "MonthlyAveragePrice": "131.96"
    },
    {
        "Code": "00632R",
        "Name": "元大台灣50反1",
        "ClosingPrice": "4.88",
        "MonthlyAveragePrice": "4.85"
    },
    {
        "Code": "00633L",
        "Name": "富邦上証正2",
        "ClosingPrice": "36.89",
        "MonthlyAveragePrice": "36.97"
    },
    {
        "Code": "00634R",
        "Name": "富邦上証反1",
        "ClosingPrice": "4.58",
        "MonthlyAveragePrice": "4.57"
    },
    {
        "Code": "00635U",
        "Name": "期元大S&P黃金",
        "ClosingPrice": "23.79",
        "MonthlyAveragePrice": "23.85"
    },
    {
        "Code": "00636",
        "Name": "國泰中國A50",
        "ClosingPrice": "20.97",
        "MonthlyAveragePrice": "20.94"
    },
    {
        "Code": "00636K",
        "Name": "國泰中國A50+U",
        "ClosingPrice": "6.54",
        "MonthlyAveragePrice": "6.55"
    },
    {
        "Code": "00637L",
        "Name": "元大滬深300正2",
        "ClosingPrice": "14.67",
        "MonthlyAveragePrice": "14.72"
    },
    {
        "Code": "00638R",
        "Name": "元大滬深300反1",
        "ClosingPrice": "9.72",
        "MonthlyAveragePrice": "9.70"
    },
    {
        "Code": "00639",
        "Name": "富邦深100",
        "ClosingPrice": "11.33",
        "MonthlyAveragePrice": "11.47"
    },
    {
        "Code": "00640L",
        "Name": "富邦日本正2",
        "ClosingPrice": "42.84",
        "MonthlyAveragePrice": "42.86"
    },
    {
        "Code": "00641R",
        "Name": "富邦日本反1",
        "ClosingPrice": "7.66",
        "MonthlyAveragePrice": "7.67"
    },
    {
        "Code": "00642U",
        "Name": "期元大S&P石油",
        "ClosingPrice": "19.53",
        "MonthlyAveragePrice": "18.95"
    },
    {
        "Code": "00643",
        "Name": "群益深証中小",
        "ClosingPrice": "12.76",
        "MonthlyAveragePrice": "12.91"
    },
    {
        "Code": "00645",
        "Name": "富邦日本",
        "ClosingPrice": "32.36",
        "MonthlyAveragePrice": "32.37"
    },
    {
        "Code": "00646",
        "Name": "元大S&P500",
        "ClosingPrice": "43.31",
        "MonthlyAveragePrice": "44.34"
    },
    {
        "Code": "00647L",
        "Name": "元大S&P500正2",
        "ClosingPrice": "60.45",
        "MonthlyAveragePrice": "63.97"
    },
    {
        "Code": "00648R",
        "Name": "元大S&P500反1",
        "ClosingPrice": "6.85",
        "MonthlyAveragePrice": "6.64"
    },
    {
        "Code": "00650L",
        "Name": "復華香港正2",
        "ClosingPrice": "10.75",
        "MonthlyAveragePrice": "11.09"
    },
    {
        "Code": "00651R",
        "Name": "復華香港反1",
        "ClosingPrice": "9.14",
        "MonthlyAveragePrice": "8.99"
    },
    {
        "Code": "00652",
        "Name": "富邦印度",
        "ClosingPrice": "33.14",
        "MonthlyAveragePrice": "33.26"
    },
    {
        "Code": "00653L",
        "Name": "富邦印度正2",
        "ClosingPrice": "48.94",
        "MonthlyAveragePrice": "49.93"
    },
    {
        "Code": "00654R",
        "Name": "富邦印度反1",
        "ClosingPrice": "7.54",
        "MonthlyAveragePrice": "7.46"
    },
    {
        "Code": "00655L",
        "Name": "國泰中國A50正2",
        "ClosingPrice": "25.60",
        "MonthlyAveragePrice": "25.66"
    },
    {
        "Code": "00656R",
        "Name": "國泰中國A50反1",
        "ClosingPrice": "8.64",
        "MonthlyAveragePrice": "8.63"
    },
    {
        "Code": "00657",
        "Name": "國泰日經225",
        "ClosingPrice": "38.56",
        "MonthlyAveragePrice": "38.83"
    },
    {
        "Code": "00657K",
        "Name": "國泰日經225+U",
        "ClosingPrice": "12.00",
        "MonthlyAveragePrice": "12.13"
    },
    {
        "Code": "00660",
        "Name": "元大歐洲50",
        "ClosingPrice": "30.66",
        "MonthlyAveragePrice": "31.04"
    },
    {
        "Code": "00661",
        "Name": "元大日經225",
        "ClosingPrice": "41.61",
        "MonthlyAveragePrice": "41.91"
    },
    {
        "Code": "00662",
        "Name": "富邦NASDAQ",
        "ClosingPrice": "61.10",
        "MonthlyAveragePrice": "62.84"
    },
    {
        "Code": "00663L",
        "Name": "國泰臺灣加權正2",
        "ClosingPrice": "120.10",
        "MonthlyAveragePrice": "122.21"
    },
    {
        "Code": "00664R",
        "Name": "國泰臺灣加權反1",
        "ClosingPrice": "5.50",
        "MonthlyAveragePrice": "5.45"
    },
    {
        "Code": "00665L",
        "Name": "富邦恒生國企正2",
        "ClosingPrice": "6.99",
        "MonthlyAveragePrice": "7.22"
    },
    {
        "Code": "00666R",
        "Name": "富邦恒生國企反1",
        "ClosingPrice": "15.58",
        "MonthlyAveragePrice": "15.35"
    },
    {
        "Code": "00668",
        "Name": "國泰美國道瓊",
        "ClosingPrice": "39.67",
        "MonthlyAveragePrice": "40.16"
    },
    {
        "Code": "00668K",
        "Name": "國泰美國道瓊+U",
        "ClosingPrice": "12.33",
        "MonthlyAveragePrice": "12.54"
    },
    {
        "Code": "00669R",
        "Name": "國泰美國道瓊反1",
        "ClosingPrice": "8.05",
        "MonthlyAveragePrice": "7.91"
    },
    {
        "Code": "00670L",
        "Name": "富邦NASDAQ正2",
        "ClosingPrice": "79.95",
        "MonthlyAveragePrice": "85.98"
    },
    {
        "Code": "00671R",
        "Name": "富邦NASDAQ反1",
        "ClosingPrice": "4.95",
        "MonthlyAveragePrice": "4.79"
    },
    {
        "Code": "00673R",
        "Name": "期元大S&P原油反1",
        "ClosingPrice": "7.41",
        "MonthlyAveragePrice": "7.58"
    },
    {
        "Code": "00674R",
        "Name": "期元大S&P黃金反1",
        "ClosingPrice": "12.60",
        "MonthlyAveragePrice": "12.57"
    },
    {
        "Code": "00675L",
        "Name": "富邦臺灣加權正2",
        "ClosingPrice": "52.45",
        "MonthlyAveragePrice": "53.52"
    },
    {
        "Code": "00676R",
        "Name": "富邦臺灣加權反1",
        "ClosingPrice": "3.04",
        "MonthlyAveragePrice": "3.01"
    },
    {
        "Code": "00678",
        "Name": "群益那斯達克生技",
        "ClosingPrice": "25.45",
        "MonthlyAveragePrice": "26.07"
    },
    {
        "Code": "00680L",
        "Name": "元大美債20正2",
        "ClosingPrice": "8.71",
        "MonthlyAveragePrice": "9.25"
    },
    {
        "Code": "00681R",
        "Name": "元大美債20反1",
        "ClosingPrice": "20.98",
        "MonthlyAveragePrice": "20.35"
    },
    {
        "Code": "00682U",
        "Name": "期元大美元指數",
        "ClosingPrice": "21.14",
        "MonthlyAveragePrice": "21.00"
    },
    {
        "Code": "00683L",
        "Name": "期元大美元指正2",
        "ClosingPrice": "22.85",
        "MonthlyAveragePrice": "22.51"
    },
    {
        "Code": "00684R",
        "Name": "期元大美元指反1",
        "ClosingPrice": "15.54",
        "MonthlyAveragePrice": "15.61"
    },
    {
        "Code": "00685L",
        "Name": "群益臺灣加權正2",
        "ClosingPrice": "46.59",
        "MonthlyAveragePrice": "47.52"
    },
    {
        "Code": "00686R",
        "Name": "群益臺灣加權反1",
        "ClosingPrice": "3.27",
        "MonthlyAveragePrice": "3.25"
    },
    {
        "Code": "00688L",
        "Name": "國泰20年美債正2",
        "ClosingPrice": "8.63",
        "MonthlyAveragePrice": "9.18"
    },
    {
        "Code": "00689R",
        "Name": "國泰20年美債反1",
        "ClosingPrice": "21.73",
        "MonthlyAveragePrice": "21.13"
    },
    {
        "Code": "00690",
        "Name": "兆豐藍籌30",
        "ClosingPrice": "27.20",
        "MonthlyAveragePrice": "27.22"
    },
    {
        "Code": "00692",
        "Name": "富邦公司治理",
        "ClosingPrice": "30.99",
        "MonthlyAveragePrice": "31.35"
    },
    {
        "Code": "00693U",
        "Name": "期街口S&P黃豆",
        "ClosingPrice": "27.20",
        "MonthlyAveragePrice": "28.26"
    },
    {
        "Code": "00700",
        "Name": "富邦恒生國企",
        "ClosingPrice": "12.47",
        "MonthlyAveragePrice": "12.61"
    }
]
"""#
        return string.data(using: .utf8) ?? Data()
    }
}
