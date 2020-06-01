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
    @objc func passBlockParam(_ block: ([Int])->String) -> String {
        return block([1, 0, 2, 4])
    }
}
