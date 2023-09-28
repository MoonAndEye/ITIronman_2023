//
//  APIClient.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/26.
//

import Foundation

protocol URLSessionProtocol {
    
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}

class APIClient {
    
    lazy var session: URLSessionProtocol = URLSession.shared
    
    func getStockClosPriceList() async throws -> [StockDailyInfoElement] {
        
        guard let url = URL(string: "https://openapi.twse.com.tw/v1/exchangeReport/STOCK_DAY_AVG_ALL") else {
            return []
        }
        
        let request = URLRequest(url: url)
        let (data, _) = try await session.data(for: request, delegate: nil)
        
        let stocks = try JSONDecoder().decode([StockDailyInfoElement].self, from: data)

        return stocks
    }
}
