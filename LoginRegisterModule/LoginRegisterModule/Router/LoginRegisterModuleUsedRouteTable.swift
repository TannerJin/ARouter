//
//  ARouterInterfaceForwarding.swift
//  LoginRegisterModule
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit

// 声明该模块用到的SEL(接口), 保证过编译而已（可以理解为编译注册）
@objc protocol LoginRegisterModuleUsedRouteTable {
    @objc func enterUserInfo(withUserName: String) -> UIViewController
}
