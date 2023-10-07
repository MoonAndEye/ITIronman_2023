//
//  MemoInputView.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/10/4.
//

import SwiftUI

struct MemoInputView: View {
    
    @StateObject var data: MemoInputData
    
    var displayText: String {
        if data.inputedString.isEmpty {
            return "請輸入文字"
        } else {
            return "你輸入的是: \(data.inputedString)"
        }
    }
    
    var body: some View {
        
        VStack {
            Text(displayText)
            TextField("請輸入交易心得", text: $data.inputedString)
        }
        .padding()
    }
}

struct MemoInputView_Previews: PreviewProvider {
    
    static let data: MemoInputData = .init()
    
    static var previews: some View {
        MemoInputView(data: data)
    }
}
