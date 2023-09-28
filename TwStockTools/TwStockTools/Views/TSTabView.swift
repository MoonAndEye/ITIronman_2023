//
//  TSTabView.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/26.
//

import SwiftUI

/// TwStockTools App 主要的 Tab View
struct TSTabView: View {
    var body: some View {
        
        TabView {
            TradingRecordListView()
            StockInfoListView()
        }
    }
}

struct TSTabView_Previews: PreviewProvider {
    static var previews: some View {
        TSTabView()
    }
}
