//
//  UserElementTests.swift
//  YouNeedTestingTests
//
//  Created by cm0679 on 2023/8/29.
//

import XCTest
@testable import YouNeedTesting // 要加這一行，不然是拿不到 internal 物件

final class UserElementTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUserElements() throws {
        
        let data = getRawData()
        let users = try JSONDecoder().decode(User.self, from: data)
        XCTAssertEqual(users.count, 3)
    }
    
    func testFirstUser() throws {
        
        let data = getRawData()
        let users = try JSONDecoder().decode(User.self, from: data)
        /// 在這邊取出第 0 個 element
        let firstUser = users.first
        /// firstUser 是 optional 的，這時可以用 XCTUnwrap 將 optional 轉出，因為我們確定有值且要拿第 0 個來測
        let model = try XCTUnwrap(firstUser)
        
        XCTAssertEqual(model.id, 1)
        XCTAssertEqual(model.name, "Leanne Graham")
        XCTAssertEqual(model.username, "Bret")
        XCTAssertEqual(model.email, "Sincere@april.biz")
        XCTAssertEqual(model.phone, "1-770-736-8031 x56442")
        XCTAssertEqual(model.website, "hildegard.org")
    }

    /// 這邊只取前三筆資料拿來做測試
    private func getRawData() -> Data {
        
        let string =
#"""
[
    {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
            "street": "Kulas Light",
            "suite": "Apt. 556",
            "city": "Gwenborough",
            "zipcode": "92998-3874",
            "geo": {
                "lat": "-37.3159",
                "lng": "81.1496"
            }
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
            "name": "Romaguera-Crona",
            "catchPhrase": "Multi-layered client-server neural-net",
            "bs": "harness real-time e-markets"
        }
    },
    {
        "id": 2,
        "name": "Ervin Howell",
        "username": "Antonette",
        "email": "Shanna@melissa.tv",
        "address": {
            "street": "Victor Plains",
            "suite": "Suite 879",
            "city": "Wisokyburgh",
            "zipcode": "90566-7771",
            "geo": {
                "lat": "-43.9509",
                "lng": "-34.4618"
            }
        },
        "phone": "010-692-6593 x09125",
        "website": "anastasia.net",
        "company": {
            "name": "Deckow-Crist",
            "catchPhrase": "Proactive didactic contingency",
            "bs": "synergize scalable supply-chains"
        }
    },
    {
        "id": 3,
        "name": "Clementine Bauch",
        "username": "Samantha",
        "email": "Nathan@yesenia.net",
        "address": {
            "street": "Douglas Extension",
            "suite": "Suite 847",
            "city": "McKenziehaven",
            "zipcode": "59590-4157",
            "geo": {
                "lat": "-68.6102",
                "lng": "-47.0653"
            }
        },
        "phone": "1-463-123-4447",
        "website": "ramiro.info",
        "company": {
            "name": "Romaguera-Jacobson",
            "catchPhrase": "Face to face bifurcated interface",
            "bs": "e-enable strategic applications"
        }
    }
]
"""#
        
        return string.data(using: .utf8) ?? Data()
    }
}
