//
//  SettlementRemindInputView.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/8/30.
//

import SwiftUI

extension StockTradingInputView {
    
    enum TradingSide: Int {
        case buy = 0
        case sell
    }
}

struct StockTradingInputView: View {
    
    @State var commodityID: String = ""
    @State var commodityName: String = ""
    
    @State var tradingSide: TradingSide = .buy
    
    @State var tradingShares: String = ""
    @State var tradingCostPerShare: String = ""
    
    var body: some View {
        VStack {
            
            Text("股票交易紀錄")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 10)
            
            HStack {
                Text("股票代號")
                    .padding(.horizontal)
                TextField("請輸入股票代號", text: $commodityID)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("股票名稱")
                    .padding(.horizontal)
                TextField("請輸入股票名稱", text: $commodityName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            
            Picker("買進賣出", selection: $tradingSide) {
                Text("買進").tag(0)
                Text("賣出").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            HStack {
                Text("成交股數")
                    .padding(.horizontal)
                TextField("請輸入成交股數", text: $tradingShares)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("成交金額(每股)")
                    .padding(.horizontal)
                TextField("請輸入成交金額(每股)", text: $tradingCostPerShare)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                Button {
                    print("cancel did tap")
                } label: {
                    Text("取消")
                        .frame(minWidth: 140, minHeight: 40)
                        .border(.red)
                }
                
                Spacer()

                Button {
                    print("cancel did tap")
                } label: {
                    Text("新增")
                        .frame(minWidth: 140, minHeight: 40)
                        .border(.blue)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct StockTradingInputView_Previews: PreviewProvider {
    static var previews: some View {
        StockTradingInputView()
    }
}
