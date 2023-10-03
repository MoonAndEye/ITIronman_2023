//
//  URLSessionProtocolMock.swift
//  TwStockToolsTests
//
//  Created by cm0679 on 2023/9/27.
//

import Foundation
@testable import TwStockTools

class URLSessionProtocolMock: URLSessionProtocol {
    
    var dataForDelegateReturnValue: (Data, URLResponse)?
    
    var dataForDelegateRequest: URLRequest?
    
    /// handle error
    var dataForDelegateError: Error?
    
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        
        /// handle error at start
        if let error = dataForDelegateError {
            throw error
        }
        
        dataForDelegateRequest = request
        
        guard let dataForDelegateReturnValue = dataForDelegateReturnValue else {
            fatalError()
        }
        
        return dataForDelegateReturnValue
    }
}
