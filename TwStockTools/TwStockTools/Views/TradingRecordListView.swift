//
//  TradingRecordListView.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/7.
//

import SwiftUI

struct TradingRecordListView: View {
    
    @StateObject var store: StockTradingRecordStore = .init()
    
    var body: some View {
        
        VStack {
            
            Text("台股交易紀錄")
            List(store.records) { record in
                
                /// 將 record 呈現出來，未來可以寫一個 cell 型的 view 來裝載 record
                HStack {
                    
                    /// 股票名字和股票代號垂直排列，並對齊 leading
                    VStack(alignment: .leading) {
                        Text(record.stockName)
                        Text(record.stockID)
                    }
                    
                    Spacer()
                    
                    /// 交易金額
                    Text("\(record.tradingAmount)")
                        .padding(.trailing, 10)
                    
                    /// 買賣方向，未來可能會改寫這一段
                    if record.tradingSide == .buy {
                        Text("買進")
                    } else {
                        Text("賣出")
                    }
                }
            }
        }
    }
}

struct TradingRecordListView_Previews: PreviewProvider {
    
    static var previews: some View {
        TradingRecordListView(store: store)
    }
    
    private static var store: StockTradingRecordStore = {
        let store = StockTradingRecordStore()
        store.add(getRecord())
        store.add(getRecord())
        return store
    }()
    
    private static func getRecord() -> StockTradingRecord {
        
        StockTradingRecord(stockID: "0050", stockName: "元大50", tradingSide: .buy, tradingShares: 1000, tradingAmount: 120000, tradingDateStr: "2023-09-07")
    }
}
