//
//  StockDailyInfo.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/26.
//

import Foundation

// MARK: - StockDailyInfoElement
struct StockDailyInfoElement: Codable, Identifiable, Equatable {
    
    var id: String {
        code
    }
    
    let code, name, closingPrice, monthlyAveragePrice: String

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case name = "Name"
        case closingPrice = "ClosingPrice"
        case monthlyAveragePrice = "MonthlyAveragePrice"
    }
}

typealias StockDailyInfo = [StockDailyInfoElement]
