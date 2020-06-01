//
//  ARouterInterfaceForwarding.swift
//  ARouterDemo
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit

// 声明该模块用到的SEL(接口), 保证过编译而已 (可以理解为编译注册)
@objc protocol ARouterDemoModuleUsedRouteTable {
    @objc func enterLogin(navi: UINavigationController, param1: Int, param2: String) -> UIViewController
    
    @objc func isLoginSuccess(param1: Int, param2: [String: Any]?) -> Bool
    
    @objc func enterRegister(controller: UIViewController)
    
    @objc func undefineSelect(param1: String, param2: Int)    
}
