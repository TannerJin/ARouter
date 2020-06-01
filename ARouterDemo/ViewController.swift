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

    // MARK: - 直接调用
    @IBAction func loginClick(_ sender: UIButton) {
        if let navi = self.navigationController {
            _ = ARouter.shared.performTarget("LoginRegisterModule.LoginViewController")?.enterLogin(navi: navi, param1: 1024, param2: "Hello")
        }
        
        // 带返回值
        if let isLogin = ARouter.shared.performTarget("LoginRegisterModule.LoginViewController")?.isLoginSuccess(param1: 2000, param2: nil) {
            print(isLogin ? "登录成功":"登录失败")
        }
    }
    
    @IBAction func registerClick(_ sender: UIButton) {
        ARouter.shared.performTarget("LoginRegisterModule.RegisterViewController")?.enterRegister(controller: self)
    }
    
    // MARK: - 通过ARouter间接调用
    @IBAction func loginStatuClick(_ sender: UIButton) {
        let str = ARouter.default.passBlockParam { (arr) -> String in
            return arr.map{String($0)}.joined()
        }
        print(str)
    }
    
    // 404处理
    @IBAction func UnrecognizedSelectorClick(_ sender: UIButton) {
        print("1.走默认的404处理:")
        ARouter.default.undefineSelect(param1: "", param2: 2)
        
        
        print("\n2.走自己的404处理逻辑:")
        ARouter.default.setHandleNotFound(for: #selector(ARouterDemoModuleUsedRouteTable.undefineSelect(param1:param2:))) { (_) -> Unmanaged<AnyObject>? in
            print("消息转发到这里，可以自己处理404")
            return nil
        }.undefineSelect(param1: "", param2: 2)
         
        
        print("\n3.可以选择不处理404")
        ARouter.default.undefineSelect?(param1: "", param2: 2)   // 由于这里加了"?"(可选调用), 不会处理404(不会进入消息转发流程)
    }
}

