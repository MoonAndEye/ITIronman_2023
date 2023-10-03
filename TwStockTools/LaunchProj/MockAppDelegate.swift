//
//  MockAppDelegate.swift
//  LaunchProj
//
//  Created by cm0679 on 2023/10/3.
//

import UIKit

@objc(MockAppDelegate)
class MockAppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /// 用來確認真的從 MockAppDelegate 啟動
        print("this is test target")
        return true
    }
}

