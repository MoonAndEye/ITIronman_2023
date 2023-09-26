//
//  TapCounterViewController.swift
//  TwStockTools
//
//  Created by cm0679 on 2023/9/19.
//

import SnapKit
import UIKit

class TapCounterViewController: UIViewController {
    
    var userDefaults: UserDefaultsProtocol = UserDefaults.standard
    
    private var count: Int = 0 {
        didSet {
            countLabel.text = "已經點擊了 \(count) 下"
            userDefaults.set(count, forKey: "tapCount")
        }
    }
    
    lazy var countLabel: UILabel = .init()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("按下去就 + 1", for: .normal)
        button.addTarget(self, action: #selector(countButtonDidTap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        count = userDefaults.integer(forKey: "tapCount")
    }
    
    private func setupUI() {
        
        countLabel.textAlignment = .center
        view.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(44)
        }
        
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.width.height.centerX.equalTo(countLabel)
            make.top.equalTo(countLabel.snp.bottom).offset(10)
        }
    }
    
    @objc
    private func countButtonDidTap() {
        count += 1
        print("current tap count: \(count)")
    }
}

extension UserDefaults: UserDefaultsProtocol {
}
