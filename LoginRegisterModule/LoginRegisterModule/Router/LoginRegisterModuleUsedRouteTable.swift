//
//  ARouterInterfaceForwarding.swift
//  LoginRegisterModule
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit

// 定义该模块用到的SEL, 保证过编译而已。运行时并不会走到这（可以理解为编译注册）
class LoginRegisterModuleUsedRouteTable {
    @objc func enterUserInfo(withUserName: String, navi: UINavigationController?) {}
}
