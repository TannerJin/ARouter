//
//  ViewController.swift
//  ARouterDemo
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit
import ARouter
// 不需要 import LoginRegisterModule, 完全由RunTime处理

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginClick(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            ARouter.default.enterLogin?(navi: navigationController)
        }
    }
    
    @IBAction func registerClick(_ sender: UIButton) {
        ARouter.default.enterRegister?(controller: self)
    }
    
    // Unrecognized Selector Sent to Instance ARouter
    @IBAction func UnrecognizedSelectorClick(_ sender: UIButton) {
        ARouter.default.undefineSelect(param1: "Unrecognized Selector Sent to ARouter", param2: 2)
        ARouter.default.undefineSelect?(param1: 1)   // 加了"?"(可选调用), 不会进入消息转发流程
    }
}

