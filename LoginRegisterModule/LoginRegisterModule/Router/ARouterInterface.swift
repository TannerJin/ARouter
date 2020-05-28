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
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        navi.pushViewController(loginController, animated: true)
    }
    
    @objc func enterRegister(controller: UIViewController) {
        let navi = UINavigationController(rootViewController: RegisterViewController())
        controller.present(navi, animated: true, completion: nil)
    }
}
