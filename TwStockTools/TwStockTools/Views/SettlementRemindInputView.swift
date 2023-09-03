//
//  SettlementRemindInputView.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/8/30.
//

import SwiftUI

struct SettlementRemindInputView: View {
    
    @State var commodityID: String = ""
    @State var commodityName: String = ""
    
    var body: some View {
        VStack {
            
            Text("股票交割提醒")
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
            
            Spacer()
        }
    }
}

struct SettlementRemindInputView_Previews: PreviewProvider {
    static var previews: some View {
        SettlementRemindInputView()
    }
}
