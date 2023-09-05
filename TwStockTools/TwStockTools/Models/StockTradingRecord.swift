//
//  SettlementModel.swift
//  TwStockTools
//
//  Created by Marvin on 2023/8/30.
//

import Foundation

struct StockTradingRecord {
    
    let stockID: String
    let stockName: String
    let tradingSide: TradingSide
    
    /// 成交股數
    let tradingShares: Int
    
    /// 成交金額
    let tradingAmount: Int
    
    /// 成交日期，格式為 yyyy-mm-dd
    let tradingDateStr: String
}
