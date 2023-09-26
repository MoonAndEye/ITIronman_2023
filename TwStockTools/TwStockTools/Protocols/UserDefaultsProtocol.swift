//
//  UserDefaultsProtocol.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/20.
//

import Foundation

protocol UserDefaultsProtocol {
    func set(_ value: Int, forKey defaultName: String)
    func integer(forKey defaultName: String) -> Int
}
