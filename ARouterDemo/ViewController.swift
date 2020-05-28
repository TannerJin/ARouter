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
    
    @IBAction func loginStatuClick(_ sender: UIButton) {
        if let isLogin = ARouter.default.isLoginSuccess?(param1: 996, param2: nil) {
            print(isLogin ? "登录成功":"登录失败")
        }
    }
    
    // Unrecognized Selector Sent to Instance ARouter
    @IBAction func UnrecognizedSelectorClick(_ sender: UIButton) {
        ARouter.default.undefineSelect(param1: "ARouter没有实现该SEL，这里会进入消息转发", param2: 2)
        ARouter.default.undefineSelect?(param1: 1)   // 由于这里加了"?"(可选调用), 不会进入消息转发流程
    }
}

