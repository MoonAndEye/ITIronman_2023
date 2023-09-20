//
//  TapCounterView.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/19.
//

import SwiftUI
import UIKit

/// 裝載 UIKit VC 的物件
struct TapCounterRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> TapCounterViewController {
        TapCounterViewController()
    }
    
    func updateUIViewController(_ uiViewController: TapCounterViewController, context: Context) {
    }
    
    typealias UIViewControllerType = TapCounterViewController
    
}

struct TapCounterView: View {
    var body: some View {
        /// 一個包著 SwiftUI 皮的 UIKit VC
        TapCounterRepresentable()
    }
}

struct TapCounterView_Previews: PreviewProvider {
    static var previews: some View {
        TapCounterView()
    }
}
