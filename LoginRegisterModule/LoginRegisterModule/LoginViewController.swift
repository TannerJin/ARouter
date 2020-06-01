//
//  LoginViewController.swift
//  LoginRegisterModule
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit
import ARouter
// 不需要 import UserInfoModule, 完全由RunTime处理

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
    }

    @IBAction func LoginSuccessClick(_ sender: UIButton) {
        if let userController = ARouter.default.performTarget("UserInfoModule.UserInfoViewController")?.enterUserInfo(withUserName: "Tanner.Jin") {
            navigationController?.pushViewController(userController, animated: true)
        }
    }
}

extension LoginViewController {
    @objc class func enterLogin(navi: UINavigationController, param1: Int, param2: String) -> LoginViewController {
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        loginController.title = param2 + "\(param1)"
        navi.pushViewController(loginController, animated: true)
        return loginController
    }
}
