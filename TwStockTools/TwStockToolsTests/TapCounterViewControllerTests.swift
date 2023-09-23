//
//  TapCounterViewControllerTests.swift
//  TwStockToolsTests
//
//  Created by cm0679 on 2023/9/20.
//

import XCTest
@testable import TwStockTools

final class TapCounterViewControllerTests: XCTestCase {

    private var sut: TapCounterViewController!
    
    private var defaults: FakeUserDefaults!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TapCounterViewController()
        defaults = FakeUserDefaults()
        sut.userDefaults = defaults
    }

    override func tearDownWithError() throws {
        sut = nil
        defaults = nil
        try super.tearDownWithError()
    }
    
    func testLabelWith6() {
        
        defaults.set(6, forKey: "tapCount")
        /// 要呼叫 loadViewIfNeeded() 不然 UI 元件反應會不如預期
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.countLabel.text, "已經點擊了 6 下")
    }
    
    func testButtonTapped() {
        /// 要呼叫 loadViewIfNeeded() 不然 UI 元件反應會不如預期
        sut.loadViewIfNeeded()
        /// 在 unit testing 中讓 button 發動 touchUpInside Action
        sut.addButton.sendActions(for: .touchUpInside)
        
        XCTAssertEqual(sut.countLabel.text, "已經點擊了 1 下")
    }
}
