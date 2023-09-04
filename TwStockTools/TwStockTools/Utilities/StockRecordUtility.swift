//
//  StockRecordUtility.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/3.
//

import Foundation

extension StockRecordUtility {
    
    enum StockRecordInputError: Error {
        case noValue
        case castingError
    }
}

struct StockRecordUtility {
    
    func getStockRecord(stockID: String, stockName: String, tradingSide: TradingSide, stockShares: String, stockCostPerShare: String) -> Result<StockTradingRecord, Error> {
        
        /// 不可以輸入空值
        if stockID.isEmpty ||
            stockName.isEmpty ||
            stockShares.isEmpty ||
            stockCostPerShare.isEmpty {
            return .failure(StockRecordInputError.noValue)
        }
        
        /// 需通過 stockShares 能轉換成 Int
        /// 需通過 stockCostPerShare 能轉換成 Int
        /// stockShares 需大於等於 0
        /// stockCostPerShare 需大於等於 0
        guard let stockSharesInt = Int(stockShares),
              let stockCostPerShareInt = Int(stockCostPerShare),
                stockSharesInt > 0,
              stockCostPerShareInt > 0 else {
            return .failure(StockRecordInputError.castingError)
        }
        
        /// amount 成交金額 是 成交股數 * 每股價價
        let amount = stockSharesInt * stockCostPerShareInt
        
        return .success(StockTradingRecord(stockID: stockID,
                                           stockName: stockName,
                                           tradingSide: tradingSide,
                                           tradingShares: stockSharesInt,
                                           tradingAmount: amount))
    }
}
