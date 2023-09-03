//
//  SettlementModel.swift
//  TwStockTools
//
//  Created by Marvin on 2023/8/30.
//

import Foundation

extension StockTradingRecord {
    
    enum TradingSide {
        case buy
        case sell
    }
}

struct StockTradingRecord {
    
    let stockID: String
    let stockName: String
    let tradingSide: TradingSide
    
    /// 成交股數
    let tradingShares: Int
    
    /// 成交金額
    let tradingAmount: Int
}
