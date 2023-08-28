//
//  CustomerNameTests.swift
//  YouNeedTestingTests
//
//  Created by cm0679 on 2023/8/28.
//

import XCTest

/// 第一版 Customer 物件
//struct Customer {
//
//    let firstName: String
//
//    let lastName: String
//
//    var displayName: String {
//
//        return firstName + lastName
//    }
//}

///// 第二版 Customer 物件，而 property 的擴充交給另一個工程師
//struct Customer {
//
//    let firstName: String
//
//    let lastName: String
//
//    var middleName: String?
//
//    var displayName: String {
//        /// 因為這任務交給一個剛來的人寫，所以那個人就這樣寫了
//        return firstName + middleName! + lastName
//    }
//}

struct Customer {

    let firstName: String

    let lastName: String

    var middleName: String?

    var displayName: String {

        /// 如果是有中間名的 user，就呈現中間名
        if let middleName = middleName {

            return firstName + middleName + lastName
        }

        /// 如果是沒有中間名的，就不處理 middle name
        return firstName + lastName
    }
}

final class CustomerNameTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
    
    func testCustomerDisplayName() {
        
        let customer = Customer(firstName: "Foo", lastName: "Bar")
        
        let answer = "FooBar"
        /// 第一次跑 unit testing，會讓 testing failed，來確保 unit testing 是正確運作的
        XCTAssertEqual(customer.displayName, answer)
    }
    
    func testCustomerDisplayNameHasMiddleName() {
        
        let customer = Customer(firstName: "Foo", lastName: "Bar", middleName: "MMM")
        
        let answer = "FooMMMBar"
        
        XCTAssertEqual(customer.displayName, answer)
    }

}
