//
//  ARouterInterface.swift
//  UserInfoModule
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit
import ARouter

// 该模块对外暴露的路由接口
extension ARouter {
    @objc func enterUserInfo(withUserName userName: String, navi: UINavigationController?) {
        UserInfoViewController.enterUserInfo(withUserName: userName, navi: navi)
    }
}
