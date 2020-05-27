//
//  LoginViewController.swift
//  LoginRegisterModule
//
//  Created by jintao on 2020/5/27.
//  Copyright © 2020 jintao. All rights reserved.
//

import UIKit
import ARouter

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
