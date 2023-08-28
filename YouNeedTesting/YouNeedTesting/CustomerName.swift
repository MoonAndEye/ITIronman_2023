//
//  CustomerName.swift
//  YouNeedTesting
//
//  Created by cm0679 on 2023/8/28.
//

import Foundation

//你寫一個 app，裡面有個類別-使用者。
//使用都在後端儲存的資料有 first name & last name
//但前端顯示的時候，要組合起來，變成 firstName lastName
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

//struct Customer {
//
//    let firstName: String
//
//    let lastName: String
//
//    var middleName: String?
//
//    var displayName: String {
//
//        /// 如果是有中間名的 user，就呈現中間名
//        if let middleName = middleName {
//
//            return firstName + middleName + lastName
//        }
//
//        /// 如果是沒有中間名的，就不處理 middle name
//        return firstName + lastName
//    }
//}
