//
//  main.swift
//  LaunchProj
//
//  Created by cm0679 on 2023/10/3.
//

import UIKit

let appDelegateClass: AnyClass = NSClassFromString("MockAppDelegate") ?? AppDelegate.self

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))
