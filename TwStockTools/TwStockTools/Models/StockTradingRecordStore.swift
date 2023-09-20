//
//  StockTradingRecordStore.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/7.
//

import Combine
import Foundation

class StockTradingRecordStore: ObservableObject {
    
    var recordPublisher = CurrentValueSubject<[StockTradingRecord], Never>([])
    
    @Published var records: [StockTradingRecord] = [] {
        didSet {
            /// 當 records 一有變化，就 send
            recordPublisher.send(records)
        }
    }
    
    func getRecord(stockID: String,
                   stockName: String,
                   tradingSide: TradingSide,
                   tradingShares: Int,
                   tradingAmount: Int,
                   tradingDateStr: String) -> StockTradingRecord {
        
        StockTradingRecord(stockID: stockID,
                           stockName: stockName,
                           tradingSide: tradingSide,
                           tradingShares: tradingShares,
                           tradingAmount: tradingAmount,
                           tradingDateStr: tradingDateStr)
    }
    
    func add(_ record: StockTradingRecord) {
        records.append(record)
    }
}
