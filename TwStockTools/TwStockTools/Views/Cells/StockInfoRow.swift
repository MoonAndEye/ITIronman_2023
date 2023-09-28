//
//  StockInfoRow.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/26.
//

import SwiftUI

struct StockInfoRow: View {
    
    @State var stockInfo: StockDailyInfoElement
    
    var body: some View {
        
        HStack {
            VStack {
                Text(stockInfo.name)
                Text(stockInfo.code)
            }
            .padding([.leading, .trailing])
            
            HStack {
                Text("收盤價: \(stockInfo.closingPrice)")
                Text("|")
                Text("月均價: \(stockInfo.monthlyAveragePrice)")
            }
            Spacer()
        }
    }
}

struct StockInfoRow_Previews: PreviewProvider {
    
    static var stockInfo: StockDailyInfoElement {
        StockDailyInfoElement(code: "0050", name: "元大50", closingPrice: "123.55", monthlyAveragePrice: "125.16")
    }
    
    static var previews: some View {
        StockInfoRow(stockInfo: stockInfo)
            .previewLayout(.fixed(width: 375, height: 60))
    }
}
