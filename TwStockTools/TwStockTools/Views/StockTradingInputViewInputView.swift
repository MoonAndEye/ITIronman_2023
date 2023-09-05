//
//  SettlementRemindInputView.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/8/30.
//

import SwiftUI

struct StockTradingInputView: View {
    
    @State var stockID: String = ""
    @State var stockName: String = ""
    
    @State var tradingSideIndex: Int = 0
    
    var tradingSide: TradingSide {
        return TradingSide(rawValue: tradingSideIndex) ?? .buy
    }
    
    @State var tradingShares: String = ""
    @State var tradingAmount: String = ""
    
    @State var isShowingDatePicker = false
    @State var emptyCalendarString = ""
    
    @State var tradingDate: Date = .now
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        VStack {
            
            Text("股票交易紀錄")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 10)
            
            HStack {
                Text("股票代號")
                    .padding(.horizontal)
                TextField("請輸入股票代號", text: $stockID)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("股票名稱")
                    .padding(.horizontal)
                TextField("請輸入股票名稱", text: $stockName)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            
            Picker("買進賣出", selection: $tradingSideIndex) {
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
                Text("成交金額")
                    .padding(.horizontal)
                TextField("請輸入成交金額", text: $tradingAmount)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
            }
            
            ZStack {
                HStack {
                    Text("成交日期")
                        .padding(.horizontal)
                    
                    ZStack {
                        TextField("", text: $emptyCalendarString)
                            .disabled(true)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            isShowingDatePicker.toggle()
                        } label: {
                            Text(tradingDate, formatter: dateFormatter)
                                .frame(minWidth: 200)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            if isShowingDatePicker {
                
                DatePicker(
                    "Start Date",
                    selection: $tradingDate,
                    in: ...Date(),
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                
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
