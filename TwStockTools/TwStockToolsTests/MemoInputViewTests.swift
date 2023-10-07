//
//  MemoInputViewTests.swift
//  TwStockToolsTests
//
//  Created by cm0679 on 2023/10/4.
//

import XCTest
@testable import TwStockTools
import ViewInspector

final class MemoInputViewTests: XCTestCase {
    
    var sut: MemoInputView!
    var data: MemoInputData!
    
    override func setUpWithError() throws {
        data = MemoInputData()
        sut = MemoInputView(data: self.data)
    }

    override func tearDownWithError() throws {
        data = nil
        sut = nil
    }
    
    func testMemoInputViewStart() throws {
        
        let expect = "請輸入文字"
        /// MemoInputView 裡面裝載了 vStack, 而 Text 在 0 個位置
        let string = try sut.inspect().vStack().text(0).string()
        XCTAssertEqual(expect, string)
    }
    
    func testMemoInputTextWithDummy() throws {
        
        let dummyText = "foo"
        let expect = "你輸入的是: foo"
        try sut.inspect().vStack().textField(1).setInput(dummyText)
        let string = try sut.inspect().vStack().text(0).string()
        XCTAssertEqual(string, expect)
    }
}
