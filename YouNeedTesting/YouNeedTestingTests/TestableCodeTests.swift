//
//  TestableCodeTests.swift
//  YouNeedTestingTests
//
//  Created by cm0679 on 2023/8/27.
//

import XCTest

final class TestableCodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

func downloadAndParseAndWriteInDB() {
    
    /// 從這個 url 拿到 user 的資訊
    guard let url = URL(string: "https://mydomain.com/getUserInfo") else {
        print("invalid url")
        /// handle error here...
        return
    }
    
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: url) { data, response, error in
        
        /// handle error....
        
        /// 如果 response 有 data, 後端的 spec 為 [String: Any] 的 json，但通常我們會建立好物件
        /// 使用物件在 app 內部進行傳接值，而不是 dict 傳接值
        if let data  {
            
            do {
                
                let userInfo = try JSONDecoder().decode(UserInfo.self, from: data)
                
                /// 這個 userInfo 物件有三個值: userID, firstName, lastName
                print("user id: \(userInfo.userID)")
                print("user firstName: \(userInfo.firstName)")
                print("user lastName: \(userInfo.lastName)")
                
                /// 寫入 Database
                LocalStorageAdapter.write(userInfo: userInfo)
            } catch {
                print("json decode error: \(error)")
            }
            
        }
    }.resume()
}

func testableDownloadAndParseAndWriteInDB() async {
    
    /// 從這個 url 拿到 user 的資訊
    guard let url = URL(string: "https://mydomain.com/getUserInfo") else {
        print("invalid url")
        /// handle error here...
        return
    }
    
    do {
        
        let data = try await NetworkManager.shared.getUserInfo().get()
        
        let userInfo = DataParser().parseToUserInfo(from: data)
        
        LocalStorageAdapter.write(userInfo: userInfo)
    } catch {
        /// handle error here
        print("Got error: \(error)")
    }
}


struct UserInfo: Decodable {
    
    let userID: String
    let firstName: String
    let lastName: String
}

struct LocalStorageAdapter {
    
    static func write(userInfo: UserInfo) {
        
    }
}

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func getUserInfo() async -> Result<Data, Error> {
        
        return .success(Data())
    }
}

struct DataParser {
    
    func parseToUserInfo(from data: Data) -> UserInfo {
        return UserInfo(userID: "", firstName: "", lastName: "")
    }
}
