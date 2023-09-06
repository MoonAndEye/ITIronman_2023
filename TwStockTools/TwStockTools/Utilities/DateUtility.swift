//
//  DateUtility.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/5.
//

import Foundation

struct DateUtility {
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    func getString(from date: Date) -> String {
        return DateUtility.dateFormatter.string(from: date)
    }
}
