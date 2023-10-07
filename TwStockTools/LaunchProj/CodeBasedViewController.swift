//
//  CodeBasedViewController.swift
//  LaunchProj
//
//  Created by cm0679 on 2023/10/7.
//

import UIKit

class CodeBasedViewController: UIViewController {
    
    let dataString: String
    
    init(dataString: String) {
        self.dataString = dataString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
