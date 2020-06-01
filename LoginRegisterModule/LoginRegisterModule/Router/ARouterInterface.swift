//
//  ARouterInterface.swift
//  LoginRegisterModule
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit
import ARouter

// 该模块对外暴露的路由接口
extension ARouter {
    @objc func enterLogin(navi: UINavigationController) {
        _ = LoginViewController.enterLogin(navi: navi)
    }
    
    @objc func enterRegister(controller: UIViewController) {
        RegisterViewController.enterRegister(controller: controller)
    }
    
    @objc func isLoginSuccess(param1: Int, param2: [String: Any]?) -> Bool {
        return LoginViewController.isLoginSuccess(param1: param1, param2: param2)
    }
    
    @objc func passBlockParam(_ block: ([Int])->String) -> String {
        return block([1, 0, 2, 4])
    }
    
    // 通过字符串调用Selector, 参数只支持一个字典, 并且加"_"
    @objc func stringSeletorAction(_ params: [String: Any]) {
        print("stringAction: ", params)
    }
}
