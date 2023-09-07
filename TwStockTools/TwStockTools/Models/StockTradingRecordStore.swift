//
//  StockTradingRecordStore.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/7.
//

import Combine
import Foundation

class StockTradingRecordStore {
    
    var recordPublisher = CurrentValueSubject<[StockTradingRecord], Never>([])
    
    var records: [StockTradingRecord] = [] {
        didSet {
            /// 當 records 一有變化，就 send
            recordPublisher.send(records)
        }
    }
    
    func add(_ record: StockTradingRecord) {
        records.append(record)
    }
}
