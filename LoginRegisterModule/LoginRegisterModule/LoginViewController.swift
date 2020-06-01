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
        self.title = "Login"
    }

    @IBAction func LoginSuccessClick(_ sender: UIButton) {
        ARouter.default.enterUserInfo?(withUserName: "Tanner Jin", navi: self.navigationController)
    }
}

extension LoginViewController {
    class func enterLogin(navi: UINavigationController) -> LoginViewController {
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: Bundle(for: LoginViewController.self))
        navi.pushViewController(loginController, animated: true)
        return loginController
    }
}
