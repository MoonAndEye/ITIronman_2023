//
//  EmptyRecordView.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/11.
//

import SwiftUI

struct EmptyRecordView: View {
    var body: some View {
        VStack {
            Text("請按右上角按鈕\n新增股票交易紀錄")
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
                .padding(.vertical)
            Image(systemName: "list.clipboard")
                .font(.system(size: 200))
            Spacer()
        }
    }
}

struct EmptyRecordView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyRecordView()
    }
}
